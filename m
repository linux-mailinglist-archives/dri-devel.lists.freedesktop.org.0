Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D78C3D11B6
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 16:50:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F33B6E9C8;
	Wed,  9 Oct 2019 14:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C7B6E9C9
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 14:50:13 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id r4so2303409edy.4
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 07:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=pPIM3FVIyT4/97LZJrg01pJy7drmhWtVlls1Zso13no=;
 b=X6nsCscaz/rKtx38a2NwTHSnOISFM67i2TxuuUvlHeYmIl8/Igl8vIkrUQfskMdYHq
 TyqmQtRhcT/39vd8p+3i2K0OeR9jTrn8GvqEBA2npMk45Vc8TnG9FRvwCj2GoiEDy/3y
 5GcEYChVhemS25wfFyQEjYbAvDYKuyJEEPABPz6vJiyd/Q+TrbxHkq6wUXIOIifviwkg
 X6LltyJ/EC1CsGr62/7Lwkf2ZxS6/UeMggxV2RtzXq+/rELAGfWMrEuSib5uTymoqMK/
 PDB9Clx9ckD5MJ52ROJ3lryRx8eiK0G+a0dP/6rHJsgTvFj1674NTcNA2AUl+oEwyUZC
 8Big==
X-Gm-Message-State: APjAAAV5r3KUODN6tkoXRFkx5JHTrb583xRYAsSB1TLxl5G1SoaHTgHG
 255yVWk78PG83tBV+3JIzHqyAQ==
X-Google-Smtp-Source: APXvYqzC/vaAU5Hwqs5iVlB9k9gKRt59IN2idRdOSETZNdFWZMypkQIsONWbgpgTS741jKSCwurSVw==
X-Received: by 2002:a50:8f65:: with SMTP id 92mr3485562edy.9.1570632612053;
 Wed, 09 Oct 2019 07:50:12 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id f36sm384659ede.28.2019.10.09.07.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 07:50:10 -0700 (PDT)
Date: Wed, 9 Oct 2019 16:50:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sandy Huang <hjc@rock-chips.com>
Subject: Re: [PATCH v2 1/3] drm: Add some new format DRM_FORMAT_NVXX_10
Message-ID: <20191009145008.GB16989@phenom.ffwll.local>
Mail-Followup-To: Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 heiko@sntech.de, linux-kernel@vger.kernel.org
References: <1569486289-152061-1-git-send-email-hjc@rock-chips.com>
 <1569486289-152061-2-git-send-email-hjc@rock-chips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1569486289-152061-2-git-send-email-hjc@rock-chips.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=pPIM3FVIyT4/97LZJrg01pJy7drmhWtVlls1Zso13no=;
 b=hVmQr1GnBuN40rDT4E/BRln+PJoMbsljTx3gzRJTOJM0UUYm8V9NUURUafrM4bJqsw
 WlpvqyEy6xMYETra2Uss7YjZaW5Lfyv4K2oVU+Ak7xSxoNmZdSkJ97LaUlomVfv6xgEQ
 qirtaSShBcRrHxGhZmzzUYOIw3ST6+UNKeZ2M=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMDQ6MjQ6NDdQTSArMDgwMCwgU2FuZHkgSHVhbmcgd3Jv
dGU6Cj4gVGhlc2UgbmV3IGZvcm1hdCBpcyBzdXBwb3J0ZWQgYnkgc29tZSByb2NrY2hpcCBzb2Nz
Ogo+IAo+IERSTV9GT1JNQVRfTlYxMl8xMC9EUk1fRk9STUFUX05WMjFfMTAKPiBEUk1fRk9STUFU
X05WMTZfMTAvRFJNX0ZPUk1BVF9OVjYxXzEwCj4gRFJNX0ZPUk1BVF9OVjI0XzEwL0RSTV9GT1JN
QVRfTlY0Ml8xMAo+IAo+IFNpZ25lZC1vZmYtYnk6IFNhbmR5IEh1YW5nIDxoamNAcm9jay1jaGlw
cy5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZm91cmNjLmMgIHwgMTggKysrKysr
KysrKysrKysrKysrCj4gIGluY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIHwgMTQgKysrKysr
KysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZm91cmNjLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2ZvdXJjYy5jCj4gaW5kZXggYzYzMDA2NC4uY2NkNzhhMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2ZvdXJjYy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mb3VyY2Mu
Ywo+IEBAIC0yNjEsNiArMjYxLDI0IEBAIGNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8gKl9f
ZHJtX2Zvcm1hdF9pbmZvKHUzMiBmb3JtYXQpCj4gIAkJeyAuZm9ybWF0ID0gRFJNX0ZPUk1BVF9Q
MDE2LAkJLmRlcHRoID0gMCwgIC5udW1fcGxhbmVzID0gMiwKPiAgCQkgIC5jaGFyX3Blcl9ibG9j
ayA9IHsgMiwgNCwgMCB9LCAuYmxvY2tfdyA9IHsgMSwgMCwgMCB9LCAuYmxvY2tfaCA9IHsgMSwg
MCwgMCB9LAo+ICAJCSAgLmhzdWIgPSAyLCAudnN1YiA9IDIsIC5pc195dXYgPSB0cnVlfSwKPiAr
CQl7IC5mb3JtYXQgPSBEUk1fRk9STUFUX05WMTJfMTAsCQkuZGVwdGggPSAwLCAgLm51bV9wbGFu
ZXMgPSAyLAo+ICsJCSAgLmNoYXJfcGVyX2Jsb2NrID0geyA1LCAxMCwgMCB9LCAuYmxvY2tfdyA9
IHsgNCwgNCwgMCB9LCAuYmxvY2tfaCA9IHsgNCwgNCwgMCB9LAo+ICsJCSAgLmhzdWIgPSAyLCAu
dnN1YiA9IDIsIC5pc195dXYgPSB0cnVlfSwKPiArCQl7IC5mb3JtYXQgPSBEUk1fRk9STUFUX05W
MjFfMTAsCQkuZGVwdGggPSAwLCAgLm51bV9wbGFuZXMgPSAyLAo+ICsJCSAgLmNoYXJfcGVyX2Js
b2NrID0geyA1LCAxMCwgMCB9LCAuYmxvY2tfdyA9IHsgNCwgNCwgMCB9LCAuYmxvY2tfaCA9IHsg
NCwgNCwgMCB9LAo+ICsJCSAgLmhzdWIgPSAyLCAudnN1YiA9IDIsIC5pc195dXYgPSB0cnVlfSwK
PiArCQl7IC5mb3JtYXQgPSBEUk1fRk9STUFUX05WMTZfMTAsCQkuZGVwdGggPSAwLCAgLm51bV9w
bGFuZXMgPSAyLAo+ICsJCSAgLmNoYXJfcGVyX2Jsb2NrID0geyA1LCAxMCwgMCB9LCAuYmxvY2tf
dyA9IHsgNCwgNCwgMCB9LCAuYmxvY2tfaCA9IHsgNCwgNCwgMCB9LAo+ICsJCSAgLmhzdWIgPSAy
LCAudnN1YiA9IDEsIC5pc195dXYgPSB0cnVlfSwKPiArCQl7IC5mb3JtYXQgPSBEUk1fRk9STUFU
X05WNjFfMTAsCQkuZGVwdGggPSAwLCAgLm51bV9wbGFuZXMgPSAyLAo+ICsJCSAgLmNoYXJfcGVy
X2Jsb2NrID0geyA1LCAxMCwgMCB9LCAuYmxvY2tfdyA9IHsgNCwgNCwgMCB9LCAuYmxvY2tfaCA9
IHsgNCwgNCwgMCB9LAo+ICsJCSAgLmhzdWIgPSAyLCAudnN1YiA9IDEsIC5pc195dXYgPSB0cnVl
fSwKPiArCQl7IC5mb3JtYXQgPSBEUk1fRk9STUFUX05WMjRfMTAsCQkuZGVwdGggPSAwLCAgLm51
bV9wbGFuZXMgPSAyLAo+ICsJCSAgLmNoYXJfcGVyX2Jsb2NrID0geyA1LCAxMCwgMCB9LCAuYmxv
Y2tfdyA9IHsgNCwgNCwgMCB9LCAuYmxvY2tfaCA9IHsgNCwgNCwgMCB9LAo+ICsJCSAgLmhzdWIg
PSAxLCAudnN1YiA9IDEsIC5pc195dXYgPSB0cnVlfSwKPiArCQl7IC5mb3JtYXQgPSBEUk1fRk9S
TUFUX05WNDJfMTAsCQkuZGVwdGggPSAwLCAgLm51bV9wbGFuZXMgPSAyLAo+ICsJCSAgLmNoYXJf
cGVyX2Jsb2NrID0geyA1LCAxMCwgMCB9LCAuYmxvY2tfdyA9IHsgNCwgNCwgMCB9LCAuYmxvY2tf
aCA9IHsgNCwgNCwgMCB9LAo+ICsJCSAgLmhzdWIgPSAxLCAudnN1YiA9IDEsIC5pc195dXYgPSB0
cnVlfSwKPiAgCQl7IC5mb3JtYXQgPSBEUk1fRk9STUFUX1AyMTAsCQkuZGVwdGggPSAwLAo+ICAJ
CSAgLm51bV9wbGFuZXMgPSAyLCAuY2hhcl9wZXJfYmxvY2sgPSB7IDIsIDQsIDAgfSwKPiAgCQkg
IC5ibG9ja193ID0geyAxLCAwLCAwIH0sIC5ibG9ja19oID0geyAxLCAwLCAwIH0sIC5oc3ViID0g
MiwKCll1cCB0aGlzIGlzIHdoYXQgSSBoYWQgaW4gbWluZCB3aXRoIHVzaW5nIHRoZSBibG9jayBz
dHVmZiB0byBkZXNjcmliZSB5b3VyCm5ldyAxMGJpdCB5dXYgZm9ybWF0cy4gVGhhbmtzIGZvciBy
ZXNwaW5pbmcuCgpPbmNlIHdlJ3ZlIG5haWxlZCB0aGUgZXhhY3QgYml0IGRlc2NyaXB0aW9uIG9m
IHRoZSBmb3JtYXQgcHJlY2lzZWx5IHRoaXMKY2FuIGJlIG1lcmdlZCBpbW8uCi1EYW5pZWwKCj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIGIvaW5jbHVkZS91YXBp
L2RybS9kcm1fZm91cmNjLmgKPiBpbmRleCAzZmVlYWEzLi4wOGUyMjIxIDEwMDY0NAo+IC0tLSBh
L2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oCj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9k
cm1fZm91cmNjLmgKPiBAQCAtMjM4LDYgKzIzOCwyMCBAQCBleHRlcm4gIkMiIHsKPiAgI2RlZmlu
ZSBEUk1fRk9STUFUX05WNDIJCWZvdXJjY19jb2RlKCdOJywgJ1YnLCAnNCcsICcyJykgLyogbm9u
LXN1YnNhbXBsZWQgQ2I6Q3IgcGxhbmUgKi8KPiAgCj4gIC8qCj4gKyAqIDIgcGxhbmUgWUNiQ3IK
PiArICogaW5kZXggMCA9IFkgcGxhbmUsIFkzOlkyOlkxOlkwIDEwOjEwOjEwOjEwCj4gKyAqIGlu
ZGV4IDEgPSBDYjpDciBwbGFuZSwgQ2IzOkNyMzpDYjI6Q3IyOkNiMTpDcjE6Q2IwOkNyMCAxMDox
MDoxMDoxMDoxMDoxMDoxMDoxMAo+ICsgKiBvcgo+ICsgKiBpbmRleCAxID0gQ3I6Q2IgcGxhbmUs
IENyMzpDYjM6Q3IyOkNiMjpDcjE6Q2IxOkNyMDpDYjAgMTA6MTA6MTA6MTA6MTA6MTA6MTA6MTAK
PiArICovCj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9OVjEyXzEwCWZvdXJjY19jb2RlKCdOJywgJ0En
LCAnMScsICcyJykgLyogMngyIHN1YnNhbXBsZWQgQ3I6Q2IgcGxhbmUgKi8KPiArI2RlZmluZSBE
Uk1fRk9STUFUX05WMjFfMTAJZm91cmNjX2NvZGUoJ04nLCAnQScsICcyJywgJzEnKSAvKiAyeDIg
c3Vic2FtcGxlZCBDYjpDciBwbGFuZSAqLwo+ICsjZGVmaW5lIERSTV9GT1JNQVRfTlYxNl8xMAlm
b3VyY2NfY29kZSgnTicsICdBJywgJzEnLCAnNicpIC8qIDJ4MSBzdWJzYW1wbGVkIENyOkNiIHBs
YW5lICovCj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9OVjYxXzEwCWZvdXJjY19jb2RlKCdOJywgJ0En
LCAnNicsICcxJykgLyogMngxIHN1YnNhbXBsZWQgQ2I6Q3IgcGxhbmUgKi8KPiArI2RlZmluZSBE
Uk1fRk9STUFUX05WMjRfMTAJZm91cmNjX2NvZGUoJ04nLCAnQScsICcyJywgJzQnKSAvKiBub24t
c3Vic2FtcGxlZCBDcjpDYiBwbGFuZSAqLwo+ICsjZGVmaW5lIERSTV9GT1JNQVRfTlY0Ml8xMAlm
b3VyY2NfY29kZSgnTicsICdBJywgJzQnLCAnMicpIC8qIG5vbi1zdWJzYW1wbGVkIENiOkNyIHBs
YW5lICovCj4gKwo+ICsvKgo+ICAgKiAyIHBsYW5lIFlDYkNyIE1TQiBhbGlnbmVkCj4gICAqIGlu
ZGV4IDAgPSBZIHBsYW5lLCBbMTU6MF0gWTp4IFsxMDo2XSBsaXR0bGUgZW5kaWFuCj4gICAqIGlu
ZGV4IDEgPSBDcjpDYiBwbGFuZSwgWzMxOjBdIENyOng6Q2I6eCBbMTA6NjoxMDo2XSBsaXR0bGUg
ZW5kaWFuCj4gLS0gCj4gMi43LjQKPiAKPiAKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJl
IEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
