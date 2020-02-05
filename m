Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D25A153FF1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:18:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A00976FA0C;
	Thu,  6 Feb 2020 08:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0247D6F917
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 18:19:12 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k11so3929754wrd.9
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 10:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e4WNWeHzzThx/k21Ar3P5/tvg+ZuZmLhOHFhJfAdS7E=;
 b=kvJcXRPoUo/wZpnYkzApxeKv3XcP+RZlDMAWeclMP7kLMdxkHRy+UGFlkw+2JyGf3E
 ky1AJoE3ZkYAp+2DzBz30pF8kXEiALwgC364CCtFiuIiAHvCzZfWkMDPhDAgksI5mbQg
 suxHkds2tl+WNXj8fPnYo41t7q2vDmD2u+H4da3MiJt/kJvJSEiBHZkf453gXwoG1QQH
 A0eBTu4VEcrmeKOyxfyKaH4OuGNL7TrD/BKy6/TAbozex3VoVJztFDJzrCoMVPfGAGde
 CgFXIjhcAgdbnHVnhFkysJov9G8XY7XFrK1itXDrbkX65Lw0OzMFJF+3RwxciDgk9cFe
 aO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=e4WNWeHzzThx/k21Ar3P5/tvg+ZuZmLhOHFhJfAdS7E=;
 b=kjc8NH+yHZ3gHbb+8OGc4uYemiUDEcp+0f9Rqh3jXMF9tXCME+Gc7yyB6Mdg2BtE8+
 dM1UOLRvrDUgQ4ooHUxzk8Sq/Zi/+ZTrqyrzAmoxuzmzSPmgQKpKESGDp+29qBPdo3/Q
 VmjTAjxye6X1A+RFu0UrIrJ+ongnPyYYesgqPiggp7rfcppXlLDxGQEc4afPvAjICpxF
 6VX+UQbwNdDMVfI2HZ/jFr3eqZW8soP99TjC6h7rk7bYSR4B0MHZfVFZ5e4wd8NJezXs
 QIOpDtmHK+KHf2nkEf7zHSZltaj2GtEFjvjKKdrFH5KYXr1Z1GhnforFjeFADYh3PmzT
 rCWw==
X-Gm-Message-State: APjAAAUDiA2FxfGFP96JXcMrqsXeNXpEVbd160/WgxBij/6N2DJPjZ+E
 lt0NfUTBemACuXRWa46+5Y4=
X-Google-Smtp-Source: APXvYqw2wELTJ9b9Zw4z1oiqAdLH/7bwkjnMY49QIK5O0TcB8txsSkdq5MlBoLmstHLvJIOyDxKcgw==
X-Received: by 2002:adf:b352:: with SMTP id k18mr29032513wrd.242.1580926750700; 
 Wed, 05 Feb 2020 10:19:10 -0800 (PST)
Received: from [192.168.1.35] (162.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.162])
 by smtp.gmail.com with ESMTPSA id z21sm449220wml.5.2020.02.05.10.19.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 10:19:09 -0800 (PST)
Subject: Re: [PATCH 1/3] fbdev/g364fb: Fix build failure
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Finn Thain <fthain@telegraphics.com.au>
References: <cover.1580610812.git.fthain@telegraphics.com.au>
 <d8f19ebc00a7688da739d41d584d081d1559f0d2.1580610812.git.fthain@telegraphics.com.au>
 <CAAdtpL7SpzfqSmEcuVszNyXfrRegC20txoS5j7Ss3WkCmyRH+g@mail.gmail.com>
Autocrypt: addr=f4bug@amsat.org; keydata=
 mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
 u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
 HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
 YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
 ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
 dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
 ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
 Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
 HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
 Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBCAA/AhsPBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJd660aBQks
 klzgAAoJEOPjLCzercDe2iMP+gMG2dUf+qHz2uG8nTBGMjgK0aEJrKVPodFA+iedQ5Kp3BMo
 jrTg3/DG1HMYdcvQu/NFLYwamUfUasyor1k+3dB23hY09O4xOsYJBWdilkBGsJTKErUmkUO2
 3J/kawosvYtJJSHUpw3N6mwz/iWnjkT8BPp7fFXSujV63aZWZINueTbK7Y8skFHI0zpype9s
 loU8xc4JBrieGccy3n4E/kogGrTG5jcMTNHZ106DsQkhFnjhWETp6g9xOKrzZQbETeRBOe4P
 sRsY9YSG2Sj+ZqmZePvO8LyzGRjYU7T6Z80S1xV0lH6KTMvq7vvz5rd92f3pL4YrXq+e//HZ
 JsiLen8LH/FRhTsWRgBtNYkOsd5F9NvfJtSM0qbX32cSXMAStDVnS4U+H2vCVCWnfNug2TdY
 7v4NtdpaCi4CBBa3ZtqYVOU05IoLnlx0miKTBMqmI05kpgX98pi2QUPJBYi/+yNu3fjjcuS9
 K5WmpNFTNi6yiBbNjJA5E2qUKbIT/RwQFQvhrxBUcRCuK4x/5uOZrysjFvhtR8YGm08h+8vS
 n0JCnJD5aBhiVdkohEFAz7e5YNrAg6kOA5IVRHB44lTBOatLqz7ntwdGD0rteKuHaUuXpTYy
 CRqCVAKqFJtxhvJvaX0vLS1Z2dwtDwhjfIdgPiKEGOgCNGH7R8l+aaM4OPOd
Message-ID: <08447d52-0007-6f68-3848-209295a61d13@amsat.org>
Date: Wed, 5 Feb 2020 19:19:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAAdtpL7SpzfqSmEcuVszNyXfrRegC20txoS5j7Ss3WkCmyRH+g@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:17:51 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 James Hogan <jhogan@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Thomas Bogendoerfer <tbogendoerfer@suse.de>, dri-devel@lists.freedesktop.org,
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMi81LzIwIDc6MDIgUE0sIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOgo+IE9uIFN1
biwgRmViIDIsIDIwMjAgYXQgMzo0MSBBTSBGaW5uIFRoYWluIDxmdGhhaW5AdGVsZWdyYXBoaWNz
LmNvbS5hdT4gd3JvdGU6Cj4+Cj4+IFRoaXMgcGF0Y2ggcmVzb2x2ZXMgdGhlc2UgY29tcGlsZXIg
ZXJyb3JzIGFuZCB3YXJuaW5ncyAtLQo+Pgo+PiAgIENDICAgICAgZHJpdmVycy92aWRlby9mYmRl
di9nMzY0ZmIubwo+PiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2czNjRmYi5jOiBJbiBmdW5jdGlvbiAn
ZzM2NGZiX2N1cnNvcic6Cj4+IGRyaXZlcnMvdmlkZW8vZmJkZXYvZzM2NGZiLmM6MTM3Ojk6IGVy
cm9yOiAneCcgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pCj4+IGRyaXZl
cnMvdmlkZW8vZmJkZXYvZzM2NGZiLmM6MTM3Ojk6IG5vdGU6IGVhY2ggdW5kZWNsYXJlZCBpZGVu
dGlmaWVyIGlzIHJlcG9ydGVkIG9ubHkgb25jZSBmb3IgZWFjaCBmdW5jdGlvbiBpdCBhcHBlYXJz
IGluCj4+IGRyaXZlcnMvdmlkZW8vZmJkZXYvZzM2NGZiLmM6MTM3Ojc6IGVycm9yOiBpbXBsaWNp
dCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnZm9udHdpZHRoJyBbLVdlcnJvcj1pbXBsaWNpdC1m
dW5jdGlvbi1kZWNsYXJhdGlvbl0KPj4gZHJpdmVycy92aWRlby9mYmRldi9nMzY0ZmIuYzoxMzc6
MjM6IGVycm9yOiAncCcgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pCj4+
IGRyaXZlcnMvdmlkZW8vZmJkZXYvZzM2NGZiLmM6MTM3OjM4OiBlcnJvcjogJ3knIHVuZGVjbGFy
ZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQo+PiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2cz
NjRmYi5jOjEzNzo3OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ2Zv
bnRoZWlnaHQnIFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+PiBkcml2
ZXJzL3ZpZGVvL2ZiZGV2L2czNjRmYi5jOiBJbiBmdW5jdGlvbiAnZzM2NGZiX2luaXQnOgo+PiBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L2czNjRmYi5jOjIzMzoyNDogZXJyb3I6ICdmYnZhcicgdW5kZWNs
YXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pCj4+IGRyaXZlcnMvdmlkZW8vZmJkZXYv
ZzM2NGZiLmM6MjM0OjI0OiBlcnJvcjogJ3hyZXMnIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0
aGlzIGZ1bmN0aW9uKQo+IAo+IDE4IHllYXJzIHVubm90aWNlZC4uLgo+IAo+PiBkcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2czNjRmYi5jOjIwMToxNDogd2FybmluZzogdW51c2VkIHZhcmlhYmxlICdqJyBb
LVd1bnVzZWQtdmFyaWFibGVdCj4+IGRyaXZlcnMvdmlkZW8vZmJkZXYvZzM2NGZiLmM6MTk3OjI1
OiB3YXJuaW5nOiB1bnVzZWQgdmFyaWFibGUgJ3BhbF9wdHInIFstV3VudXNlZC12YXJpYWJsZV0K
Pj4KPj4gVGhlIE1JUFMgTWFnbnVtIGZyYW1lYnVmZmVyIGNvbnNvbGUgbm93IHdvcmtzIHdoZW4g
dGVzdGVkIGluIFFFTVUuCj4+Cj4+IENjOiBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpv
bG5pZXJraWVAc2Ftc3VuZy5jb20+Cj4+IEZpeGVzOiAxZGExNzdlNGMzZjQgKCJMaW51eC0yLjYu
MTItcmMyIikKPiAKPiBUaGlzIGNvbW1pdCBpcyB0aGUga2VybmVsICdnaXQgb3JpZ2luJyBpbXBv
cnQsIG5vdCB0aGUgcHJvcGVyIHJlZmVyZW5jZS4KPiAKPiBUaGUgYWN0dWFsIGNoYW5nZSBpcyBi
ZXR3ZWVuIHYyLjUuMTcvMi41LjE5Ogo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3RnbHgvaGlzdG9yeS5naXQvZGlmZi9kcml2ZXJzL3ZpZGVvL2czNjRm
Yi5jP2lkPWIzMGU2ZTE4M2E3Mjg5MjMyNjcKPiBEYXRlOiAyMDAyLTA1LTIyIDA3OjUyOjMzLi4u
Cj4gCj4gVGhlIHNhbWUgY29tbWl0IGludHJvZHVjZWQgdGhlIGNoYW5nZXMgaW4gZzM2NGZiX2N1
cnNvcigpLCB3aGljaCB3YXMKPiBpbXBsZW1lbnRlZCBwcmV2aW91cyB0byB2Mi40LjAgc28gaXQg
aXMgaGFyZCB0byBmb2xsb3cgZnJvbSB0aGVyZS4KPiAKPiBOb2JvZHkgY29tcGxhaW5zIGR1cmlu
ZyAxOCB5ZWFycyBzbyBJIGRvdWJ0IGFueW9uZSBjYXJlIHRoYXQKPiBnMzY0ZmJfY3Vyc29yKCkg
aXMgcmVtb3ZlZC4KPiBBbmQgYnkgcmVtb3ZpbmcgaXQsIHlvdSBpbXByb3ZlIHRoZSBrZXJuZWwg
cXVhbGl0eSwgc286Cj4gUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1
Z0BhbXNhdC5vcmc+Cj4gKE1heWJlIHJlbW92ZSB0aGUgdW5oZWxwZnVsICdGaXhlcycgdGFnKS4K
PiAKPj4gU2lnbmVkLW9mZi1ieTogRmlubiBUaGFpbiA8ZnRoYWluQHRlbGVncmFwaGljcy5jb20u
YXU+Cj4+IC0tLQo+PiAgZHJpdmVycy92aWRlby9mYmRldi9nMzY0ZmIuYyB8IDI5ICsrKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAyNiBkZWxldGlvbnMoLSkKCk5vdGUsIHlvdSBuZWVkIHRvIHJlYmFzZSB5b3VyIHNlcmllcyBk
dWUgdG86CgogIGNvbW1pdCA4YTQ4YWMzMzkzOThmMjEyODI5ODViZmYxNjU1MjQ0N2Q0MWRjZmIy
CiAgQXV0aG9yOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgogIERhdGU6ICAg
VHVlIERlYyAzIDE4OjM4OjUwIDIwMTkgKzAyMDAKCiAgICAgIHZpZGVvOiBjb25zdGlmeSBmYiBv
cHMgYWNyb3NzIGFsbCBkcml2ZXJzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
