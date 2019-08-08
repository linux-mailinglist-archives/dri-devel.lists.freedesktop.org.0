Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 276BF8691B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 20:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7377D6E8B0;
	Thu,  8 Aug 2019 18:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5026E8AD;
 Thu,  8 Aug 2019 18:54:06 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z1so95944292wru.13;
 Thu, 08 Aug 2019 11:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LOP3JntYPgb4inWvNcmObUOMv1XMpxVUdJZwgqRnphQ=;
 b=Odo88aiNePaldVLvSqp9INpJRRII2WoxtQb2POAPEojXbkZDnH2ISG+jfMAn5cH1nz
 llAoXw+AZhPHI+h5SanmOnIExHckqzIwzU5TrH3X1JIoovZ8LHEiRUJTeXdI5ML0mACQ
 TCLLrGOZkYF0pwAFDYUJNd+5EZBl+75oXARZFCofJD3DYH4l5qdC5bDiup/ZGY6os5Iw
 4+HtJ+VhTfx9DJmPMni78ivAnXp+y8r+B5pnJ+7Js50L/8kwzGAP1k25yDxgvZP+1E5S
 PRzySaJ6iXcizValMG6b7VmR/Mo/CJ6lmZdDTeQ2eExPWHEnaPSMbmOq1RoCVOqr3rYe
 lFjA==
X-Gm-Message-State: APjAAAWJVQeC7+yiUzJHAotlG/HKDTlMJpmtlGXND7gyZP6Z82zEAxbD
 JSgruUEAX8uU8NibqZNtOZPYtAc3RT7/8VNAydM=
X-Google-Smtp-Source: APXvYqwHdYZA2F2s3/isE9T5301ZzT69++eZM1KslECeXSEnQQ5qDk0pE15X4tdOrg8UzJKAGqstnnoZHpTP8wjEkQg=
X-Received: by 2002:a5d:6ccd:: with SMTP id c13mr19608509wrc.4.1565290444617; 
 Thu, 08 Aug 2019 11:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <5d47f990.1c69fb81.a5d88.ee1f@mx.google.com>
 <20190805111205.GB6432@sirena.org.uk>
 <20190808184149.GA441@roeck-us.net>
In-Reply-To: <20190808184149.GA441@roeck-us.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 Aug 2019 14:53:52 -0400
Message-ID: <CADnq5_NL6+AohC-3HJa+84k50ewqYLMy_VuFmgY=aw872JFf-A@mail.gmail.com>
Subject: Re: next/master build: 230 builds: 5 failed, 225 passed, 6 errors,
 1344 warnings (next-20190805)
To: Guenter Roeck <linux@roeck-us.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LOP3JntYPgb4inWvNcmObUOMv1XMpxVUdJZwgqRnphQ=;
 b=eaQQQALibSFNaHCTtKDmgbd6OwQvK7RGFuHD6JI1IJGY+L0d6D9+9MLhpt/Zcuuxpc
 R/pui5mbXDUebn2oc5ZC5exlpHHbetvpA1S82Ttkyxq7mAashE7oUxu31+OVvABkfyRD
 OStZAGKWnEQQp2enyfGH7YIAux0R9TkCZqClnmhTukh7FqHHWf6Wq2ETjGDoVzhBSsd1
 sRzPUdDD41PxRH4rPo/PZDqiB4spDOm7rkOLOgp+Qy+6rfX15sckDpVrzrKi482/KqY1
 M3d9smR9bOuDG/wzPuz6CzQUU8T/z84Ze45Qh4NLGGyuxLycASdx9AE+ub75tHCIZfze
 4zGg==
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
Cc: kernel-build-reports@lists.linaro.org, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Tao Zhou <tao.zhou1@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Dennis Li <dennis.li@amd.com>, Mark Brown <broonie@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgOCwgMjAxOSBhdCAyOjUzIFBNIEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNr
LXVzLm5ldD4gd3JvdGU6Cj4KPiBPbiBNb24sIEF1ZyAwNSwgMjAxOSBhdCAxMjoxMjowNVBNICsw
MTAwLCBNYXJrIEJyb3duIHdyb3RlOgo+ID4gT24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMDI6NDA6
MzJBTSAtMDcwMCwga2VybmVsY2kub3JnIGJvdCB3cm90ZToKPiA+Cj4gPiBUb2RheSdzIC1uZXh0
IGZhaWxzIHRvIGJ1aWxkIGFuIGFybSBhbGxtb2Rjb25maWcgZHVlIHRvOgo+ID4KPiA+ID4gYWxs
bW9kY29uZmlnIChhcm0sIGdjYy04KSDigJQgRkFJTCwgMiBlcnJvcnMsIDE2IHdhcm5pbmdzLCAw
IHNlY3Rpb24gbWlzbWF0Y2hlcwo+ID4gPgo+ID4gPiBFcnJvcnM6Cj4gPiA+ICAgICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmM6Mjc5Ojk6IGVycm9yOiBpbXBsaWNp
dCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAncmVhZHEnOyBkaWQgeW91IG1lYW4gJ3JlYWRiJz8g
Wy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gPiA+ICAgICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmM6Mjk4OjM6IGVycm9yOiBpbXBsaWNp
dCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnd3JpdGVxJzsgZGlkIHlvdSBtZWFuICd3cml0ZWIn
PyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiA+Cj4gPiBkdWUgdG8g
NGZhMWM2YTY3OWJiMCAoZHJtL2FtZGdwdTogYWRkIFJSRUc2NC9XUkVHNjQoX1BDSUUpIG9wZXJh
dGlvbnMpCj4gPiB3aGljaCBpbnRyb2R1Y2VzIHVzZSBvZiByZWFkcSgpIGFuZCB3cml0ZXEoKS4K
Pgo+IEFGQUlDUyB0aGlzIHByb2JsZW0gYWZmZWN0cyBhbGwgMzItYml0IGJ1aWxkcywgaW5jbHVk
aW5nIGkzODYuCj4gSXMgaXQgaW4gdGhlIHByb2Nlc3Mgb2YgYmVpbmcgZml4ZWQsIG9yIHNob3Vs
ZCB3ZSBzdWJtaXQgYQo+IHBhdGNoIGxpbWl0aW5nIERSTV9BTURHUFUgdG8gNjQtYml0IGJ1aWxk
cyA/CgpZZXMsIHRoZSBmaXggaXMgYmVpbmcgZGlzY3Vzc2VkIGhlcmU6Cmh0dHBzOi8vcGF0Y2h3
b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8zMjIyMTMvCgpBbGV4Cgo+Cj4gR3VlbnRlcgo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBt
YWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
