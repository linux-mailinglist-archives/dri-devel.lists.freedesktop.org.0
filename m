Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB2FA9B59
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 09:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176D289DD2;
	Thu,  5 Sep 2019 07:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6904D893EA
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 17:12:07 +0000 (UTC)
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.100.89]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MDByG-1hxp3u0YNY-00GafH; Wed, 04
 Sep 2019 19:11:38 +0200
Subject: Re: drm/amdgpu: Delete an unnecessary check before two function calls
From: Markus Elfring <Markus.Elfring@web.de>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Chunming Zhou <David1.Zhou@amd.com>, Dan Carpenter
 <dan.carpenter@oracle.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, Kevin Wang <Kevin1.Wang@amd.com>,
 Tom St Denis <tom.stdenis@amd.com>, Wang Xiayang <xywang.sjtu@sjtu.edu.cn>
References: <a3739125-5fa8-cadb-d2b8-8a9f12e9bacd@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <ef57fbc1-8c67-c6ae-42b8-0de76df7cea3@web.de>
Date: Wed, 4 Sep 2019 19:11:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <a3739125-5fa8-cadb-d2b8-8a9f12e9bacd@web.de>
Content-Language: en-US
X-Provags-ID: V03:K1:ZLeBkHBr0q8jZES0PP9vBzsioYA+llirF1PkWN6y5UMtFezSU2w
 HgB0h+917mYE4zlr5XhyodWdIsDaVEp2j1SrejmFdj5b6nO32jnWWfnLz2HCH1mio8JeMDH
 TKjn4QGJ8I7Qgkv8Bhr2+ntYCDL5RIZCK0A0Wjt2rR8AfQAXalrub0LmB0SqPixUKOlwN3d
 xBOIPXPVs74Y+INDqb2cg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:sWbJhIOyBiU=:FYC4UUvU+ss+XcEqxiXYgR
 lOui+4bFpaI9DOcnB73MjeFafN0OExxjfYlr86y9pkuLqfwDo4zB20BRTVlERyN2LU56ieqB4
 rmNSFELRvVvuE6IvlL1o6THtek4SXHAMmt0DkPDX6GHv4IUyuu9ml93EcZmwCx2J+r1tBE5w2
 qsNbDVVPSOjHhtP/Yb1mvxF5A1TOENy00Og7P6w597L2qHZYSbvAPfGzdiJvjCjV+onHEQTtT
 YFKCRf0PFmdd16s+ubfj6/h//FXe0c41BE/ethA6py4cUET4y+bNEQmK+q2stlJpTiLf1wvqz
 oX1iV6fSR/ztGNZYB0uMOBvU/AwZLjRCAurfR4hhuQHa3/S+cqzgoDOwr6VSUydRfV+lwndj1
 bjuuzlmGn3uQjpDJDj33qVjXMI9oBE+zRTZzOjgye8ZNualFElOwv3u1tvA22Ph3qT5rVCzzp
 fJMzUU0KNAzk11Yoauyx0rxqP1LC1rkSNIh63O/dHpXctkEf7bUhmqG8GXv0NwsczOLB/RlnN
 +BhTYMg/gzyF+Tx8kdVzBgok2I9xL5K637prF/k7EroA5poKQg/C5iGr5cxcSzJM7lsCfatDR
 5j0jJ5E9Iufhp72LtOJmh4+/3Zlu/yX+isfMp1BwAHGo3W9BraqoSIatSAMaVL3vd1CK1rwaI
 IzhKPrPUIXe9aWtXGoFx5cCOVsfQjd6AMb/A1GjPrFKQKtT41BTDms6E099lM4ylK9npSU/OL
 e1hEzE5n9CtABfw9eDyFY4TTNoi5DeRr9XOiqinC3jzGH5u1pTjikC6/rlKJW2wfzdlGCTojx
 1LYMVTsoDjgOeSsIrKOZDFF2beg6lwUlzXvV2gGa1vTgnl8E8shgghlZbUeV8l27zVihW4V8L
 7luqEODPEG/3tYESdXPdurcHGwMRsB6gYgOsUeGjxUq05/VMCB5v0ZPHqXULcLwwqAmnMMkDe
 ZXvWDzCleulqOnqrHStitWwz8PFK1mM5BvTs1mfRg8UEoAAGs/SIX7MzHZzH+C2Y29lUQeinL
 F2SZmpNvgfPR/2TTve6yPy+Np+shGfN+gqZTe1SKHKuE17P3PRAiu219zS3SSmpKQ25gD0qDK
 HtrduvmIxLWbVIi6kMlzxAr+KbiD/HOEcsm2XDJXUSp6QKRtZzIHoiZmDftifjOpWnW9dVUgL
 vlLwirqvyvbHtOhNe2diWIJEAdcR1UJqAefAyDmavWbN9V4c2rq2X1a8C3ZRqIZrGrDhxB6wm
 rKj3tldt3emUSikrp
X-Mailman-Approved-At: Thu, 05 Sep 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=web.de; s=dbaedf251592; t=1567617098;
 bh=8FYBlMNDa4QYgsP1spn0LFhetvVOppJuogo1VyWwUo4=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
 b=ov4XHsiB3hMhvYSxUtDOft97TLnObg04hWJw5qxWsa8g4KMAPT+g59/DQPImIuH6U
 /0VqsocaxGem/ZZKRogeCYE6WTurYxn4AKwn3HbfDBl6g+EQJR/PZL/EqWIWxoz2xp
 LblC4emPTILkam5RmwQ/m9uPN1+RI+WKldvwDJNE=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBUaGUgZnVuY3Rpb25zIOKAnGRlYnVnZnNfcmVtb3Zl4oCdIGFuZCDigJxrZnJlZeKAnSB0ZXN0
IHdoZXRoZXIgdGhlaXIgYXJndW1lbnQKPiBpcyBOVUxMIGFuZCB0aGVuIHJldHVybiBpbW1lZGlh
dGVseS4KPiBUaHVzIHRoZSB0ZXN0cyBhcm91bmQgdGhlIHNob3duIGNhbGxzIGFyZSBub3QgbmVl
ZGVkLgo+Cj4gVGhpcyBpc3N1ZSB3YXMgZGV0ZWN0ZWQgYnkgdXNpbmcgdGhlIENvY2NpbmVsbGUg
c29mdHdhcmUuCgpJIHN1Z2dlc3QgdG8gdGFrZSBhbm90aGVyIGxvb2sgYXQgYSBzaW1pbGFyIHBh
dGNoLgoKZHJtL2FtZGdwdTogcmVtb3ZlIHRoZSByZWR1bmRhbnQgbnVsbCBjaGVjawpodHRwczov
L2xrbWwub3JnL2xrbWwvMjAxOS85LzMvNTkKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3
b3JrL3BhdGNoLzExMjMxMTgvCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMTU2NzQ5MTMwNS0x
ODMyMC0xLWdpdC1zZW5kLWVtYWlsLXpob25namlhbmdAaHVhd2VpLmNvbS8KClJlZ2FyZHMsCk1h
cmt1cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
