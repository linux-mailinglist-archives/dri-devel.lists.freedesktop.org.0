Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C61E10E99D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 12:40:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168176E1A2;
	Mon,  2 Dec 2019 11:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20706E1A5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 11:39:59 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id y5so14979624lfy.7
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 03:39:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9AXdWyFAclFn13sYq0pMWe+evKU32jvfVEFicCGuVwY=;
 b=ZUN3ypLWSmT3eSC00dBF+BfPmGUOoN5KXDiNScoI4O7CJkVeaa0GfaOCbpCViei+3G
 +qHPCPCFoWot2xz4j+VaE3kMj0s8vITljSE0ppO/8M5pVXOIFzKQJbSx6DYbtgAJUBCa
 VqUdHf7y4SUOcw5woDGJpQrGMPZEYz3brwIjd/pwCIwmJSTMC3oaQowGV92VXKmj0ZWL
 2uxwFWaK+WaEDahcwwsr+d5tLeD0pPRHJio9FGnZlyzenrh/NshL9ZC+8SJXIOdSQ4EV
 bI9f2CF2kxk0r8y8QEAEZboWceiSuF/p4vaxDUfyAjbdjvKNIvdj6ZrT4fpm1bTQRD/t
 JVWQ==
X-Gm-Message-State: APjAAAWjEBQ+CgmnAjPv35OAWggaLocxKHMICPQhIbQNoQmZn3aUhedt
 MZ5KR/C+EmAxF66pagRVhLvkfRdlyvK1WYpCIo6Dag==
X-Google-Smtp-Source: APXvYqx2Wc0CWurXekKEoRooxu6BjHTqZX5eqMTporx3hixdjbyvTWmDISPC0k/mqp1/gmeglDUYzSFsw3VmDEKZxKU=
X-Received: by 2002:ac2:410a:: with SMTP id b10mr15580087lfi.135.1575286798112; 
 Mon, 02 Dec 2019 03:39:58 -0800 (PST)
MIME-Version: 1.0
References: <20191129185836.2789-1-hdegoede@redhat.com>
 <20191129185836.2789-2-hdegoede@redhat.com>
In-Reply-To: <20191129185836.2789-2-hdegoede@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 2 Dec 2019 12:39:45 +0100
Message-ID: <CACRpkda9jLpGaQTVco4QyXQKPs3ZODbRb58fPfcAodnxR_s4zA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: baytrail: Add GPIO lookup and pinctrl-map
 for i915 DSI panel ctrl
To: Hans de Goede <hdegoede@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=9AXdWyFAclFn13sYq0pMWe+evKU32jvfVEFicCGuVwY=;
 b=X/Fh8vTd858T4fJqkrWSfForEze8ojEa3X1bRGcK0nqZXBG+9kxs9RGPa0AR50CzI7
 4PJkYH4WzO5ravUIXPqtvt+RQjCCNoduD0UVGXrjqrF+U9cXukY8HPMLXRZvBsiU3Juy
 c/HKNvcTVoljWSsN0A6S4Iy0ZTWB0DByymPl5BfRTGEpeR6hNCcTha9QzPKBap6a6Zb2
 jGLaCDwtWadYDtdFh7Sg+iOic31Pu2s5K+fFAu2OjUD1XkpfYHNIJTHcTMZpC7yoKSXN
 KtXkcIT8WeMxT5HtA12ZlWblRCJlJNLyJu4rljttptX+0VRpkNYmU/xb2Tmr6/45JlCs
 KQpg==
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
Cc: ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSGFucyEKClRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCk9uIEZyaSwgTm92IDI5LCAyMDE5IGF0
IDc6NTggUE0gSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4gd3JvdGU6Cgo+IE9u
IEJheSBUcmFpbCBkZXZpY2VzIHRoZSBNSVBJIHBvd2VyIG9uL29mZiBzZXF1ZW5jZXMgZm9yIERT
SSBMQ0QgcGFuZWxzCj4gZG8gbm90IGNvbnRyb2wgdGhlIExDRCBwYW5lbCBhbmQgYmFja2xpZ2h0
IEdQSU9zLiBTbyBmYXIgd2UgaGF2ZSBiZWVuCj4gcmVseWluZyBvbiB0aGVzZSBHUElPcyBiZWlu
ZyBjb25maWd1cmVkIGFzIG91dHB1dCBhbmQgZHJpdmVuIGhpZ2ggYnkKPiB0aGUgVmlkZW8gQklP
UyAoR09QKSB3aGVuIGl0IGluaXRpYWxpemVzIHRoZSBwYW5lbC4KPgo+IFRoaXMgZG9lcyBub3Qg
d29yayB3aGVuIHRoZSBkZXZpY2UgaXMgYm9vdGVkIHdpdGggYSBIRE1JIG1vbml0b3IgY29ubmVj
dGVkCj4gYXMgdGhlbiB0aGUgR09QIHdpbGwgaW5pdGlhbGl6ZSB0aGUgSERNSSBpbnN0ZWFkIG9m
IHRoZSBwYW5lbCwgbGVhdmluZyB0aGUKPiBwYW5lbCBibGFjaywgZXZlbiB0aG91Z2ggdGhlIGk5
MTUgZHJpdmVyIHRyaWVzIHRvIG91dHB1dCBhbiBpbWFnZSB0byBpdC4KPgo+IExpa2V3aXNlIG9u
IHNvbWUgZGV2aWNlLW1vZGVscyB3aGVuIHRoZSBHT1AgZG9lcyBub3QgaW5pdGlhbGl6ZSB0aGUg
RFNJCj4gcGFuZWwgaXQgYWxzbyBsZWF2ZXMgdGhlIG11eCBvZiB0aGUgUFdNMCBwaW4gaW4gZ2Vu
ZXJpYyBHUElPIG1vZGUgaW5zdGVhZAo+IG9mIG11eGluZyBpdCB0byB0aGUgUFdNIGNvbnRyb2xs
ZXIuCj4KPiBUaGlzIGNvbW1pdCBhZGRzIEdQSU8gbG9va3VwcyBhbmQgYSBwaW5jdHJsLW1hcCB3
aGljaCB0aGUgaTkxNSBkcml2ZXIgY2FuCj4gdXNlIHRvIGdldCB0aGUgcGFuZWwtIGFuZCBiYWNr
bGlnaHQtZW5hYmxlIEdQSU9zIGFuZCB0byBtdXggdGhlIFBXTTAgcGluCj4gdG8gdGhlIFBXTSBj
b250cm9sbGVyLgo+Cj4gTm90ZSBpdCBtYXkgc2VlbSBhIGJpdCB3ZWlyZCB0byBhZGQgYSBwaW5j
dHJsLW1hcCBmb3IgdGhlIGk5MTUgZHJpdmVyLAo+IHNvIHRoYXQgaXQgY2FuIHNldCB0aGUgUFdN
MCBwaW5tdXguIERvaW5nIHRoaXMgZnJvbSB0aGUgTFBTUyBQV00gZHJpdmVyCj4gd291bGQgYmUg
bW9yZSBsb2dpY2FsLiBCdXQgdGhlIG9ubHkgdGhpbmcgdGVsbGluZyB1cyB0aGF0IHRoZSBwaW4g
c2hvdWxkCj4gZGVmaW5pdGVseSBiZSBtdXhlZCB0byB0aGUgUFdNIGNvbnRyb2xsZXIgaXMgdGhl
IFZCVCB0byB3aGljaCB0aGUgUFdNCj4gZHJpdmVyIGRvZXMgbm90IGhhdmUgYWNjZXNzLgo+Cj4g
U2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KKC4uLikK
ClRoZSBjb2RlIHNldHRpbmcgdXAgdGhlIHBpbmN0cmwgbWFwIGFuZCB0aGUgR1BJTyBtYWNoaW5l
CmRlc2NyaXB0b3IgZXNzZW50aWFsbHkgbG9va3MgZ29vZCB0byBtZS4KClRoaXMgbG9va3MgYSBi
aXQgd2VpcmQ6CgorICAgICAgIGlmIChzb2NfZGF0YSA9PSAmYnl0X3Njb3JlX3NvY19kYXRhKSB7
CgpDYW4geW91IGRvIHRoaXMgd2l0aCBleHBsaWNpdCBwbGF0Zm9ybSBJRCBzdHJpbmcKY29tcGFy
aXNvbiBpbnN0ZWFkPwoKaWYgKCFzdHJjbXAoc29jX2RhdGEtPnVpZCwgQllUX1NDT1JFX0FDUElf
VUlEKSkgeyAuLi4KCkl0IHNlZW1zIG1vcmUgYXBwcm9wcmlhdGUgdG8gbWUuCgpXaGF0IGlzIHB1
enpsaW5nIGlzIHRoZSBwbGFjZW1lbnQgaW5zaWRlIHRoZSBwaW5jdHJsIGRyaXZlcjoKbm9ybWFs
bHkgdGhlIHRoaW5nIHRoYXQgc3Bhd25zIHRoZSBkZXZpY2VzIG9uIHRoZSBwbGF0Zm9ybQpzdWNo
IGFzIHRoZSAiYnl0X2dwaW8iIHNob3VsZCByZWdpc3RlciB0aGlzIHRhYmxlIHRvby4KCkhvd2V2
ZXIgSSBzZWUgdGhhdCB0aGUgZGV2aWNlIGNvbWVzIGZyb20gdGhlIEFDUEkgbWF0Y2guCgpUd28g
cXVlc3Rpb25zOgoKLSBJcyB0aGlzIG9uZSBvZiB0aG9zZSBjYXNlcyB3aGVyZSBBQ1BJICJzaG91
bGQgaGF2ZQogIHRob3VnaHQgb2YgdGhpcyIgKGEgY29tbW9uIHBocmFzZSkgYW5kIHdlIGhhdmUg
dG8gbW9wCiAgdXAgdGhlIG1lc3MgaW4gdGhlIGtlcm5lbCBiZWNhdXNlIEFDUEkgZGlkbid0IGFu
ZCBub3cKICB3ZSBoYXZlIHRvIHF1aXJrIGFyb3VuZCBpdD8KCi0gQ2FuIHdlIGluIHRoYXQgY2Fz
ZSBoYW5kbGUgdGhpcyB3aXRoIGEgImJvYXJkZmlsZSIgb2YKICBxdWlya3MgdW5kZXIgc2F5IGRy
aXZlcnMvcGxhdGZvcm0gd2hlcmUgd2UgcmVnaXN0ZXIKICBzb21lIGV4dHJhIHN0dWZmIHJhdGhl
ciB0aGFuIGluc2lkZSB0aGUgcGluY3RybCBkcml2ZXI/CgpJdCBzb3J0IG9mIGNvbm5lY3RzIHRv
IHRoZSBvdGhlciByZXZpZXcgY29tbWVudHMgd2hlcmUKSSBmZWVsIHdlIHNob3VsZCBiZSBzcGF3
bmluZyBncGlvIGJhY2tsaWdodCBkZXZpY2VzIGZyb20Kc29tZXdoZXJlLgoKSSB1bmRlcnN0YW5k
IHRob3NlIHRoaW5ncyBtYXkgYmUgYSBiaXQgYmlnLCBpZiB0aGUgaW50ZWwKcGluY3RybCBtYWlu
dGFpbmVycyBhcmUgZmluZSB3aXRoIHRoaXMgc29sdXRpb24gSSBhbSBmaW5lCndpdGggaXQgdG9v
LCBpdCdzIG5vdCBsaWtlIGl0IGlzIHRoZSBiaWdnZXN0IGRlYWwsIEkgYW0ganVzdCB3b3JyaWVk
CnRoYXQgd2UgbWlnaHQgYmUgc3RvY2twaWxpbmcgdGhlc2UgcXVpcmtzIGFsbCBvdmVyIHRoZSBw
bGFjZQp3aGlsZSB0aGV5IHNob3VsZCBwZXJoYXBzIGJlIGNlbnRyYWxpemVkLgoKWW91cnMsCkxp
bnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
