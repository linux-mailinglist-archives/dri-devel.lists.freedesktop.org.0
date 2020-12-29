Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5232E71C2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Dec 2020 16:23:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B2589126;
	Tue, 29 Dec 2020 15:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66CF889126
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Dec 2020 15:23:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02649207BD
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Dec 2020 15:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609255421;
 bh=X6TWp8dtmGsNefHM5i1nqwfEHyC2PBReZvmW2bXfzjs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YiK96+qPYqPeQfZbYUCC5myl9I5msotfpsB1XpSD0MI3yAeOItyLc1a5So/p06XLw
 kZ1YsdWfBEOra1Q9hlC9D5BgTeYrox5JqgXx9iw6iF7uULCPEFQE5TPC+6FAFKK0jC
 lDxtiPcDu5rkv2zFo1TRIt1nQ4PhU9Pkg25Oj4MW6ZSN1yJe/yvxlyTuhgSxFqpHwV
 /+PqbfhSUOCGFXKXQh4XOv6RYJ/u7+KPX8eGhIWWGdO9T5xXTZlL8Tvc87aRVV5kYq
 pM9w49egp49Lr0BxicP+ofmhSLy+rD0ocGxjFpZ6f92653v8iMSOKzAfVHFN2QGgzk
 Z4+X63LZTOIHA==
Received: by mail-wm1-f44.google.com with SMTP id k10so2823930wmi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Dec 2020 07:23:40 -0800 (PST)
X-Gm-Message-State: AOAM530Fic987/aPO62hZx8s2ZqSNLAVAibKSF62gh93PkPZBqNfIukp
 vZVF8P/tPlxQ4pogMcuXzK8A9CdraaM1YoD5hQ==
X-Google-Smtp-Source: ABdhPJzqoSYiS8eONYJzh10hdAnaMFldS8v6+IVw1T9bzfQwd+ZdVmWEddSO/Y3HQ64cIJxjddzsuEn54GHCRRPwA2w=
X-Received: by 2002:a1c:790f:: with SMTP id l15mr3965420wme.188.1609255419668; 
 Tue, 29 Dec 2020 07:23:39 -0800 (PST)
MIME-Version: 1.0
References: <1609144630-14721-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609144630-14721-5-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1609144630-14721-5-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 29 Dec 2020 23:23:27 +0800
X-Gmail-Original-Message-ID: <CAAOTY_98vrwQrefD9KwvsM+9+tDpNcUwbLoVwu_mXRf17imuTA@mail.gmail.com>
Message-ID: <CAAOTY_98vrwQrefD9KwvsM+9+tDpNcUwbLoVwu_mXRf17imuTA@mail.gmail.com>
Subject: Re: [PATCH v3, 4/8] soc: mediatek: mmsys: add component OVL_2L2
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDEy5pyIMjjml6Ug6YCx5LiAIOS4i+WNiDQ6Mzflr6vpgZPvvJoKPgo+IFRo
aXMgcGF0Y2ggYWRkIGNvbXBvbmVudCBPVkxfMkwyCgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBI
dSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5n
IE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvbGludXgv
c29jL21lZGlhdGVrL210ay1tbXN5cy5oIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1t
bXN5cy5oIGIvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmgKPiBpbmRleCA0
YjZjNTE0Li40MjQ3NmMyIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVr
L210ay1tbXN5cy5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lz
LmgKPiBAQCAtMjksNiArMjksNyBAQCBlbnVtIG10a19kZHBfY29tcF9pZCB7Cj4gICAgICAgICBE
RFBfQ09NUE9ORU5UX09WTDAsCj4gICAgICAgICBERFBfQ09NUE9ORU5UX09WTF8yTDAsCj4gICAg
ICAgICBERFBfQ09NUE9ORU5UX09WTF8yTDEsCj4gKyAgICAgICBERFBfQ09NUE9ORU5UX09WTF8y
TDIsCj4gICAgICAgICBERFBfQ09NUE9ORU5UX09WTDEsCj4gICAgICAgICBERFBfQ09NUE9ORU5U
X1BXTTAsCj4gICAgICAgICBERFBfQ09NUE9ORU5UX1BXTTEsCj4gLS0KPiAxLjguMS4xLmRpcnR5
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQu
b3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
