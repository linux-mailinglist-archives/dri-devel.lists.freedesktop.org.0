Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D179B1751
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 13:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C8410E2F3;
	Sat, 26 Oct 2024 11:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="ZEbYFYnn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic314-19.consmr.mail.ir2.yahoo.com
 (sonic314-19.consmr.mail.ir2.yahoo.com [77.238.177.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0997A10E2D3
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2024 11:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1729941185; bh=jzjqCwjIAn6SOKZQuKOVn4p0WJlb1canFhY/ix5Ne2g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=ZEbYFYnnO46BqBnbyaz87DilummLj/Cn6mVyX/24Q+jryO9NV2vkbFkgS136/fvf4z5p0Hrw6dqiZ1gzUZBSmwbma4iBoepaQtJummsFIN0rDzT+3nhOi3wj97NH4vxOUM7uNQ1ClaQ5klFIHF7M4GAHdMv+EjwEX0PEV6FrU87fsF8gfghQurvIJgj5DLqpto1csMkIjV5St7kwBsm6Uy7YROJypst21+Vyd8rqHB3g5PyK+fKC70BPAOHKwCF+sUUz5x9sYFhsRWPsf/BtKArOwM8yCM23xK03oFYvZ0q2D9DAkaYss/ozszJoeFXrW1ldP712ZwC1f06iHNakxw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1729941185; bh=OQars5ohHp30FUL/BsMivPnlvvMT4HzkZ2hm/tqhTV2=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=QK2TOuYG2/NaGp6eCgJHk6HGQr6ycBMXJbJlKp5thsUfDw5oSEnykygwIzcIm/ebiCpqfvpgpCeJO13uFqIvRvnHiVZ9dpGGGELMbl5bE4xryEbh7mVSa7ZlcwO8nr1DTIKtPMSRiTcakiiMBOtWO16bBDkSISbOmeyGkO24F1PKVOIfrTvIkdo2L4/3BL9oq6W/HoAqSF4qdlh9F4NZZJjV0WGpc6jdwcn/pBS61uyZsqRAxFjZ58vyaku++mirWMG2dLLkQ6xUFsYFKY+s40WvmeFlY0VaR1rIsQN6MRIPd9MCfI+eq2g1fhgdVZsz8XKIk2aAWYoipSN8gLxESw==
X-YMail-OSG: 71ws99IVM1m7x0WCxX73k2X.ldWfFQbqgPdbmZr34lD9LYd5.FrJKSgnMAgLkmE
 f4c_Q6KgOqqbuj.fAXXCB3H8Olv464Upo4OwHKWLFzJr5HPY6RwQKzKzEbfTSm79_PzKPT90yFyJ
 YvVYWQAJP5FQQTM2ndLWxm958JyQpdlrlI0_pFH5TblJRBVXZ2A6qgN.QOVRPXaxM.fibb5HBr_E
 UTJ9RI2JgyvR0wiYaG3V9yQ0WMPajeaoO9Wj3x1SokpMIzdljNVhewjb9KqDxTX63QAE7gAWDBOT
 iSqrRO1.sQQAAYPpV.Qx6C.P.R8QeAS5Lqu.W61C3FsHitGR5Ymqh832kVSWzfdXq62ITCAiHmfs
 XjZJOF845WN20zKRsFK.vNqv1mUE_qCnjZf8gCfvTXcw1q3cvoN8ELG0yrL_ZsIgUBvaf4Vo4ln.
 4dwDiDZ85UL6ATUDQfoI0lK2.If5H7vyQ_s4cyqoxkgvCq_.MI1vn.78nh0TotXqvXRcfAif.Qan
 2TxkUY8B5cZ2NcroPgUJsI_D7Z7cHUCZESGe06DAovfMUxLEnDnwfQt0sY8aN9uw.9F1PCWzLbT1
 UypAGBK8vIsKtVDxteKZlwXLPynvQ.jQpcklFIh2kjVzTUga5F4AWwuOa4E832JX_ptrrV5kg_2E
 wMBTE8nnbux5dyN9372nB3lC21kGKo2iLRzCFSZZkxO8rkUmTJOFVW2MVkxQmXUeBcU2LeU.Nz8T
 .q8WsXH3xuQQbOl5wyvqtzVApP.VrNaE286_uAO1b44rqLIEjCmXydrhPacJHdeCtNtJPv8Nsgno
 0_PmT5KpDyU0g8CTl3_gz1.vUIYD_jHd68qvMaIHFKl7Zkdt9xjsvaRRVXn3SFxl25a9wBFCpLtX
 vhpmvv94fXf9f6USIsqCYkZ4Dy1gY1JjQsjHgYcun_2wDlwjm7dOX1LsYhNCQAtxIRuNmcEYosxL
 6CF29P_82rT6zsM.yI9w4h.tbe4RRhtuupvLfFrlIOlFc12GEgjLkfhCDzMsRqYVnsP56DTm9qM4
 2teamAEj1BKAHzVh7JTZ3E_RPTRRCPmCxmm_PyTvlvr6hCRwr8R75IjG0ZZ8jWlJfRljjDSvqmtk
 2u_Dti8qq1M_N9trVe_0qOOdkWu.xIYX_1bVW1Dt9ylduI7Ul9EwUY14qQdFH32kz.akNoBy7uYV
 Z_nzkwWiHgplHZUZT_qMd.ECQwP8aG84Bf3UIPBL1IgXYQCJvdHEdma8zv.eScxf61Ls_v3zBo.b
 8OwHYH29sB8EDM2u8V2WertRXnYiHM_JFwnax4bXGc69aDbon2lmUc4kOgROMKs9afP2OphMgyIk
 _kt2.JeqWlpoBNZ33txKCjOFUXc63T1w0C5aOM7o81U67qgyUgD50jAdatoGLFEmKqh_3VIcgLLr
 RcxvQo3.yR7IZ3kt6gAqlxjqxaxgrPXv1_MsifoSYBRhxWGyZe6Z5dUq.PrGjoqNb6HQC1rtrbUZ
 4yD09eHaXHAx1m7XLgbGb1.Qf6pgwgj01I6jQ4mH5ZFOgsWAiMxyeLyZc.axRWAJ0xro77UxUruW
 TnYo2jmbnP3wlVat8t2YTPnnQ_wbJjyiKzl.C8N.mR_qwamdpJPsSa55xXHNCnD6GBdH_SG1XCMV
 UHmzaroUJIXg3h0VR5UeqpKi6NY46_936t1lGMsCyVM5RwZBVZK7Ablvg0o7QYXe9XUgRYKbYeOE
 W7i2OPoPsIj6yjQQxkqjxa0_8AQXo49s47CxSxSYmTgGKY1I7BCtIGVxjp9JNK3ieJuLK.PEpEJt
 CJLC7XwRYAgTrDQBhtZEjDWiSzq6ZHNuJxAPET018cB7Ag.ilWX.fmFpfaXMfty.O3mzpqpB6pqT
 mStQomZqMYxuW0a2TUbLJdMXEi8DrHr5Ak8TWvxXu.N2QK1Wa9G9vey17mGwa_AkIN7eTiDoDU.0
 H6Isrsetqk8BVz8iCv_NuJfR7YsvA6BRN9x3mAbqFIla9863FUC7wK4SXBXSL4OPCYhD93FWVTTF
 giJR7GhIyDGWiPjcvOZpmLribhBRaiNsb1JAZk9VTRknYg0le0ewORm_Mrrh6L3xrdtybCh4jB6W
 T0tk8zn6dC6IJTgnnclXOK1XFqPs3RqDkP4IbZTAfkIox6NJAAH5O2zG_Wqbitn4.fXsipGwkfzS
 m4arAnDtUuU9d2HfUn_8p0YYhDXdsGKUCjM2w.KpnHxD5_PqBFMBNnWXE68YdYd9r1gNjESmVvRX
 wwtH1GOVQ71g7R0YZdp8k2KGwQd09T8cbvcA8ksEYTPCCKimH96alKd6j0SHqFY18yAX3_lOMlvq
 YuTvIekhqh2TVN17D1SRKI3A7NMFx8TKXHnZVFU0-
X-Sonic-MF: <jahau@rocketmail.com>
X-Sonic-ID: 22a6f5cd-7af9-4326-b65e-8d6e4bc02132
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.ir2.yahoo.com with HTTP; Sat, 26 Oct 2024 11:13:05 +0000
Received: by hermes--production-ir2-c694d79d9-h5tj6 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 5bb438183100cab3b9878666a457b459; 
 Sat, 26 Oct 2024 11:13:03 +0000 (UTC)
Message-ID: <c2c08d39-0be5-42fb-b888-0d4e8db3f85d@rocketmail.com>
Date: Sat, 26 Oct 2024 13:13:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] drm/panel: samsung-s6e88a0-ams427ap24: Add flip
 option
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <cover.1729738189.git.jahau@rocketmail.com>
 <886ce1a2443dfb58496f47734d1ceffd3325fb4b.1729738189.git.jahau@rocketmail.com>
 <CACRpkdYp+3sqbZPZt78wKaJPUxh7yq1+WS6jnZ9fFSTROJAqmA@mail.gmail.com>
Content-Language: en-US
From: Jakob Hauser <jahau@rocketmail.com>
In-Reply-To: <CACRpkdYp+3sqbZPZt78wKaJPUxh7yq1+WS6jnZ9fFSTROJAqmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Mailer: WebService/1.1.22806
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGludXMsDQoNCk9uIDI1LjEwLjI0IDIxOjMyLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0K
Li4uDQo+IE9uIFRodSwgT2N0IDI0LCAyMDI0IGF0IDU6MTjigK9BTSBKYWtvYiBIYXVzZXIg
PGphaGF1QHJvY2tldG1haWwuY29tPiB3cm90ZToNCj4gDQo+PiBUaGUgd2F5IG9mIGltcGxl
bWVudGluZyBhIGZsaXAgb3B0aW9uIGZvbGxvd3MgdGhlIGV4aXN0aW5nDQo+PiBwYW5lbC1z
YW1zdW5nLXM2ZThhYTAuYyBbMV1bMl1bM10uDQo+IA0KPiBUaGF0IGRyaXZlciBpcyBub3Rv
cmlvdXNseSBoYXJkIHRvIHJlYWQgYmVjYXVzZSBpdCB1c2VzIHNvIG11Y2gNCj4gbWFnaWMg
bnVtYmVycyBzbyBwbGVhc2UgZG9uJ3QgY29weSB0aGF0IGFzcGVjdCBvZiB0aGUgZHJpdmVy
Lg0KDQpBY3R1YWxseSBJIHVzZWQgdGhhdCBzYW1lIGFwcHJvYWNoIGZvciB0aGUgZmxpcCBv
cHRpb24uIFRoZSANCmltcGxlbWVudGF0aW9uIG9mIGZsaXAgbG9va2VkIHZlcnkgd2VsbCB0
byBtZS4gSSB3YW50ZWQgdG8gc3RhdGUgaXQgYXMgDQpzb3VyY2UgaW4gdGhlIGNvbW1pdCBt
ZXNzYWdlLiBJIGRvbid0IGZlZWwgY29tZm9ydGFibGUgd2l0aG91dCBkZWNsYXJpbmcgaXQu
DQoNCj4gKC4uLikNCj4gDQo+PiArICAgICAgIGlmIChjdHgtPmZsaXBfaG9yaXpvbnRhbCkN
Cj4+ICsgICAgICAgICAgICAgICBtaXBpX2RzaV9kY3Nfd3JpdGVfc2VxX211bHRpKCZkc2lf
Y3R4LCAweGNiLCAweDBlKTsNCj4gDQo+ICNkZWZpbmUgUzZFODhBMF9TRVRfRkxJUCAweGNi
DQo+IG9yIHNvbWV0aGluZyBsaWtlIHRoaXMuDQoNClRoZSAweGNiIGNvbW1hbmQgcmVnaXN0
ZXIgbWlnaHQgYmUgbW9yZSBhIGdlbmVyYWwgcGFuZWwgY29udHJvbCwgbm90IA0Kb25seSBz
ZXJ2aW5nIHBhbmVsIGZsaXAuIEJ1dCBJIGNhbid0IHNheSBmb3Igc3VyZS4gVHJhbnNsYXRp
bmcgc2luZ2xlIA0KY29tbWFuZHMgdG8gY29tbWFuZCByZWdpc3RlciBuYW1lcyBiZWNvbWVz
IHRvbyBhcmJpdHJhcnkuDQoNCi4uLg0KDQpLaW5kIHJlZ2FyZHMsDQpKYWtvYg0K
