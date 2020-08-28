Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1489B25553D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 09:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC816EB5A;
	Fri, 28 Aug 2020 07:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4F36E127
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 05:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1598592112;
 bh=WD3AJvfzF9oAQ+hbHrZsou5r5C78WR8jKTk/O/wDxkc=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=bhCGu83IIKmtmmNDUf2qiJ8fQ+syL2IrcoYwvcwZYbZNoiu7CzhFqkLrnr3WvF6qI
 RmKuT8w0Vi2ZTeqhHvQfMole1GlGC2xHpuuqZBn+VFJs0mktANxVDxjVpz1x+gKubS
 DZgWaey4t7a9ZbQt18hh3rUNEfykbUocbTPsDJic=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([185.53.41.233]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mwwdl-1kW4vD0uKZ-00yTBG; Fri, 28
 Aug 2020 07:21:52 +0200
Date: Fri, 28 Aug 2020 07:21:46 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <CAAOTY_9R24-tcAMSfDhxLEXDFPAbMd5fYm8EwGODDMpULq-UZA@mail.gmail.com>
References: <20200819081752.4805-1-linux@fw-web.de>
 <20200819081752.4805-4-linux@fw-web.de>
 <trinity-14a1b182-38ab-4f84-bb72-94d448b05fd5-1597994235320@3c-app-gmx-bs37>
 <81276d4c-8883-8bfd-d7d0-9b9ac025ed97@gmail.com>
 <trinity-ddd51146-41eb-49ae-9456-4588450d31aa-1598535710011@3c-app-gmx-bap26>
 <e0edfd9f-5916-80ee-3bef-92d7050f97db@gmail.com>
 <CAAOTY_9R24-tcAMSfDhxLEXDFPAbMd5fYm8EwGODDMpULq-UZA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: Aw: Re: [PATCH v5 3/7] drm/mediatek: disable tmds on mt2701
To: linux-mediatek@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <B3A0E53D-ADC0-4D67-B9C2-70009DDD5D36@public-files.de>
X-Provags-ID: V03:K1:7PW5OPifrURLSHF7MjbrcWo5/B8RnBtD0szhETXVFhtYaU1kflx
 8RahuKcyckTIREd1Fujksg+Qo9pSqdK75DMSepPIN5mlJqSxvoSRfvem2ypHN5VizKwVrZw
 Z/6Of3tVfXrI1Nj4Ts4XF2VzbDbe9fIkdJWfnCCweJe0FLWrzWP1Pl4e8bCca9DBES1LOZl
 mp6yVVTPMo0VfSfa560xw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QBOEfSUFWXw=:RAuERleBgbJ+4wBWJIU4j5
 qcxsB6bPgpyUh3OQLvDAXj/+9fyNvY003SbBu64EJT2wl6Fe9hK3cpU0Rmg1rXnRbQbvY4EVz
 9u3+zEIIdouB8Sx6PGGlylWAkm/c5thKzxtG14yMQjkRToDqd9O1ziiLPcdzwtyUXDeXdEVX8
 F5U28qUIO7Fp6rBFIIZFyWdy6NVDHLGE5ac0GDc7ox33UCWyu7fj2HM1vIqsOIMfEWkZOxLpX
 yMkmqZut/9jpNOSZJq0IfJ1OGqFGXyv4y+QCqgO5uq63BFjUCi6f+zVlmGr6Ue4GciHr8z9au
 OrAwLLIRmJlvlyBlV2rBq1yOzGrdyJtCpHyS1bq9fqdDEnwiulNVNqUeziK5nRsDyjDtEdHqe
 tPcHkmfaocY0pp9Lo2X+1gfT1ZdwYHIeDJD9y1pNZyfrNymU8S//hhSa+PaKN9iRCK6ONNOin
 yASBTGWLG8j1f1HWRkfVTGeGyPB38ElZRxxVQ0ppu5HYcHSIpvm0wYO4z5Hc7QVP1UCXNg89W
 fMTShvEG9yvhps6WZGyHG52BpnXJ9O2SrmrCIy1+1uM8vymn3uD8ZxR5/lYGdrxLho4/dgTt3
 1070daybhPTjV0xwiWRfewsCnFUNC79IhyvvspBO+iBRRjFGGoN+eaOQ+0eILURRYwPIQPdhN
 wSp8FYPxSbUtVv3Vo3VvTSSn/y1Ba/Xr4sS3WPa3eYvJA3rdN83llebo19mEpYt2ZvT1yK3Us
 FtafbmGMF7ntFR/2/qxyDEQDGCkXbsYVpkzvwN0ykhbNjIP0C90Ol78b2rH125uRLK2sWfUjx
 JaH3mV3rYiA0YDO5RatiQnSuSO1y4qQiHOrXWzvwBr/6Hq+Uvxg/SxyVN5nxxhl2EuXeCVeOP
 hBptGE++PkS6hcv46bBuDOl1wDTkAbphH6BbJap9IxqjAOFqw+nYD3KHItf9kyHwhbNxR1NBd
 qT2EEWWtVATO8TRlvaU6qw2r3Ag6H8R+JhuJJXdKd5hkk4epnSxPdVDz9Tr4iOqx2x2Y9ZY9j
 OQe5xijS0g5Q9UQL86D78rmAUCXgRTeHJbuyNeP0UFrpJ62lBs/8sWU899JX62xyFJWMus/Wd
 aVz5hMKReYPr2aBZ27qB13nyRo5+JugLgBGIyoswYxQ2rVC5iNEW77poNbuGnn9bQCnIozChg
 1go5OIwy2mKBdYLtBWXjfMrajv76V9JvBznUsAbjTkZdH99aizmzz1Lsw5tkg+JlES65SCvXg
 +JxmknOM2vQzOj4Gxbe4zOjKCHcC+aDA/LuJJiw==
X-Mailman-Approved-At: Fri, 28 Aug 2020 07:29:10 +0000
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
Reply-To: frank-w@public-files.de
Cc: chunkuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Frank Wunderlich <linux@fw-web.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aG91dCB0aGlzIHBhdGNoIGkgaGF2ZSBmbGlja2VyaW5nL2hvcml6b250YWwgZGlzdG9ydGlv
biAobG9va3MgbGluZSBldmVyeSBzZWNvbmQgbGluZSBoYXMgZGlmZmVyZW50IHggcG9zaXRpb24g
YXMgb25lIGFib3ZlIGFwcHJveC4gNSBweCkgb24gbXkgMTI4MHgxMDI0IHRmdC4KCkZiY29uIGlz
IHVucmVhZGFibGUgd2l0aCB0aGlzIHByb2JsZW0uCgpIYXJkIHRvIGRlc2NyaWJlIGJ5IHdvcmRz
IG9ubHkgOigKCkFtIDI4LiBBdWd1c3QgMjAyMCAwMTo0NjowNyBNRVNaIHNjaHJpZWIgQ2h1bi1L
dWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Ogo+SGksIEZyYW5rOgo+Cj5NYXR0aGlh
cyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPiDmlrwgMjAyMOW5tDjmnIgyN+aXpSDp
gLHlm5sg5LiL5Y2IMTA6Mjjlr6vpgZPvvJoKPj4KPj4KPj4KPj4gT24gMjcvMDgvMjAyMCAxNTo0
MSwgRnJhbmsgV3VuZGVybGljaCB3cm90ZToKPj4gPiBIaSBNYXR0aGlhcywKPj4gPgo+PiA+IGFu
eSBvcGluaW9ucyBhYm91dCB0aGUgZHRzLWNoYW5nZXM/Cj4+ID4KPj4KPj4gdGhleSBsb29rIGdv
b2QgdG8gbWUuCj4+Cj4+ID4gbWF5YmUgc2VyaWVzIGV4Y2VwdCB0aGUgdG1kcy1QYXRjaCBnZXQg
bWVyZ2VkLi4uc28gaSBhZGQgaXQgb25seSB0bwo+bXkgb3duIHJlcG8gdGlsbCB3ZSBmaW5kIGEg
YmV0dGVyIHdheT8KPj4gPiBjdXJyZW50bHkgbWFpbmxpbmUgZG9lcyBub3Qgc3VwcG9ydCBoZG1p
IGF0IGFsbCBmb3IgdGhlIGJvYXJkLiB0aGUKPnRtZHMtcGF0Y2ggaXMgb25seSBhIGZpeCBmb3Ig
c3BlY2lmaWMgcmVzb2x1dGlvbnMgd2hpY2ggaGF2ZSBhCj4iZmxpY2tlcmluZyIgd2l0aG91dCB0
aGlzIFBhdGNoLgo+PiA+Cj4+Cj4+IFdlbGwgbGV0J3Mgc2VlIHdoYXQgQ0sncyBvcGluaW9uLgo+
Pgo+Cj5CZWNhdXNlIG5vIG9uZSBoYXMgY29tbWVudCBvbiB0aGlzIHBhdGNoLCBJIGNvdWxkIGFw
cGx5IHRoaXMgcGF0Y2ggYnV0Cj5JIG5lZWQgeW91IHRvIGFkZCBtb3JlIGV4cGVyaW1lbnQgaW5m
b3JtYXRpb24gc28gaWYgc29tZW9uZSBtZWV0cwo+YW5vdGhlciBidWcsIGhlIGNvdWxkIGZpeCBo
aXMgYnVnIGFuZCBjb25zaWRlciB5b3VyIHByb2JsZW0uCj4KPlJlZ2FyZHMsCj5DaHVuLUt1YW5n
Lgo+Cj4+IFJlZ2FyZHMsCj4+IE1hdHRoaWFzCj4KPl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj5MaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKCnJlZ2FyZHMgRnJhbmsKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
