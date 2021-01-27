Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B51CC3070F3
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4E26E917;
	Thu, 28 Jan 2021 08:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B50B6E3D0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 10:47:58 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id a25so1546010ljn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 02:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nt9pdiLty5VAzHiVzQ9Z0VE2Bkzi2Zy4BkFRJGQTy+s=;
 b=RkI69ax2YOOuKLnURhraOk6rkuVkZAdIrcLC8ROzb78X3XKcsHv7ZkY1MlD4SJgGMv
 mvSeWdPu6cvDFRvCbp1iTBbLA1Zl8F7eXpM479ayN+NeCBRjUZ9u4HUy3EzFV1sYTJcy
 PYB/fNUbJlr64E477+47TxBf7b4ryCO7tAewLY6czi6NhEMjHxiI15j/4hIaqSUmrqvt
 hnkovTZkaCRWB504JvBAbJB02VSyoiNAOfs8HPotmXVpd8A4rbeS6mMZhro1+rQDyfcn
 ljPWQoMwPkLz6Wc1OU0ppRL02EqrNXZCGQXG1ygbkLlN+Jif1Tk4RsoVvqn8fhhDYg0j
 bsvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nt9pdiLty5VAzHiVzQ9Z0VE2Bkzi2Zy4BkFRJGQTy+s=;
 b=mlBfBN4sIvXbljXq8kFMeGzIbYandttvi9jCJov1milFKsJWBvJkaCPZOsum1Qglaf
 hH8eDPaIbVsL+vbPCv2lP6OVikGY7bslNS5i84IvPlZhkuvTJIo4fzssLlnxLZEyqgKu
 LYjj5GWXaZUfWQDBia78RS9cEmfrR8aKtTBrAg61YMsWYBIoLtUQqiXUjTS7/AXHCG9K
 lWli+e/kAI42tsZ7eNZaRcTgiTvv3B/VmPOtfs3zIPmr3f/I7RIH6IorrnuN5rjl8pjh
 0TZimDxxSXOPIAjcJ3vobFZjQk/lAoSF/CCyyk17JMc31HuKybr9pt2cWITYxhhPdN9e
 wcHg==
X-Gm-Message-State: AOAM532YqD8DhpXGGXDVSuN4BBb2mb1RpQkUI7bp9g+nm+mCCOBlojD9
 Sk0OxgKi4TAUlQdk1xiLrxk7f+XTcW1r0jncPs+PEA==
X-Google-Smtp-Source: ABdhPJwad4Dbjby0b67biXG1UmzBFT032qoQOR80f/hQK6P7qLf8Q2hmv4TTfsdOlkWpWnRX5IIbsSeyI8gxECdjNcI=
X-Received: by 2002:a2e:908e:: with SMTP id l14mr5465324ljg.226.1611744476438; 
 Wed, 27 Jan 2021 02:47:56 -0800 (PST)
MIME-Version: 1.0
References: <20210126225138.1823266-1-kaleshsingh@google.com>
In-Reply-To: <20210126225138.1823266-1-kaleshsingh@google.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 27 Jan 2021 11:47:29 +0100
Message-ID: <CAG48ez2tc_GSPYdgGqTRotUp6NqFoUKdoN_p978+BOLoD_Fdjw@mail.gmail.com>
Subject: Re: [PATCH] procfs/dmabuf: Add /proc/<pid>/task/<tid>/dmabuf_fds
To: Kalesh Singh <kaleshsingh@google.com>
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
Cc: Michal Hocko <mhocko@suse.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Szabolcs Nagy <szabolcs.nagy@arm.com>, dri-devel@lists.freedesktop.org,
 Yafang Shao <laoar.shao@gmail.com>, Hui Su <sh_def@163.com>,
 Michel Lespinasse <walken@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jeffrey Vander Stoep <jeffv@google.com>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 kernel-team <kernel-team@android.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, linaro-mm-sig@lists.linaro.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Bernd Edlinger <bernd.edlinger@hotmail.de>,
 Suren Baghdasaryan <surenb@google.com>,
 Alexey Gladkov <gladkov.alexey@gmail.com>,
 kernel list <linux-kernel@vger.kernel.org>, Minchan Kim <minchan@kernel.org>,
 Andrei Vagin <avagin@gmail.com>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux API <linux-api@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

K2plZmZ2IGZyb20gQW5kcm9pZAoKT24gVHVlLCBKYW4gMjYsIDIwMjEgYXQgMTE6NTEgUE0gS2Fs
ZXNoIFNpbmdoIDxrYWxlc2hzaW5naEBnb29nbGUuY29tPiB3cm90ZToKPiBJbiBvcmRlciB0byBt
ZWFzdXJlIGhvdyBtdWNoIG1lbW9yeSBhIHByb2Nlc3MgYWN0dWFsbHkgY29uc3VtZXMsIGl0IGlz
Cj4gbmVjZXNzYXJ5IHRvIGluY2x1ZGUgdGhlIERNQSBidWZmZXIgc2l6ZXMgZm9yIHRoYXQgcHJv
Y2VzcyBpbiB0aGUgbWVtb3J5Cj4gYWNjb3VudGluZy4gU2luY2UgdGhlIGhhbmRsZSB0byBETUEg
YnVmZmVycyBhcmUgcmF3IEZEcywgaXQgaXMgaW1wb3J0YW50Cj4gdG8gYmUgYWJsZSB0byBpZGVu
dGlmeSB3aGljaCBwcm9jZXNzZXMgaGF2ZSBGRCByZWZlcmVuY2VzIHRvIGEgRE1BIGJ1ZmZlci4K
Ck9yIHlvdSBjb3VsZCB0cnkgdG8gbGV0IHRoZSBETUEgYnVmZmVyIHRha2UgYSByZWZlcmVuY2Ug
b24gdGhlCm1tX3N0cnVjdCBhbmQgYWNjb3VudCBpdHMgc2l6ZSBpbnRvIHRoZSBtbV9zdHJ1Y3Q/
IFRoYXQgd291bGQgcHJvYmFibHkKYmUgbmljZXIgdG8gd29yayB3aXRoIHRoYW4gaGF2aW5nIHRv
IHBva2UgYXJvdW5kIGluIHByb2NmcyBzZXBhcmF0ZWx5CmZvciBETUEgYnVmZmVycy4KCj4gQ3Vy
cmVudGx5LCBETUEgYnVmZmVyIEZEcyBjYW4gYmUgYWNjb3VudGVkIHVzaW5nIC9wcm9jLzxwaWQ+
L2ZkLyogYW5kCj4gL3Byb2MvPHBpZD4vZmRpbmZvIC0tIGJvdGggb2Ygd2hpY2ggYXJlIG9ubHkg
cm9vdCByZWFkYWJsZSwgYXMgZm9sbG93czoKClRoYXQncyBub3QgcXVpdGUgcmlnaHQuIFRoZXkg
Y2FuIGJvdGggYWxzbyBiZSBhY2Nlc3NlZCBieSB0aGUgdXNlcgpvd25pbmcgdGhlIHByb2Nlc3Mu
IEFsc28sIGZkaW5mbyBpcyBhIHN0YW5kYXJkIGludGVyZmFjZSBmb3IKaW5zcGVjdGluZyBwcm9j
ZXNzIHN0YXRlIHRoYXQgZG9lc24ndCBwZXJtaXQgcmVhZGluZyBwcm9jZXNzIG1lbW9yeSBvcgpt
YW5pcHVsYXRpbmcgcHJvY2VzcyBzdGF0ZSAtIHNvIEkgdGhpbmsgaXQgd291bGQgYmUgZmluZSB0
byBwZXJtaXQKYWNjZXNzIHRvIGZkaW5mbyB1bmRlciBhIFBUUkFDRV9NT0RFX1JFQURfRlNDUkVE
IGNoZWNrLCBqdXN0IGxpa2UgdGhlCmludGVyZmFjZSB5b3UncmUgc3VnZ2VzdGluZy4KCj4gICAx
LiBEbyBhIHJlYWRsaW5rIG9uIGVhY2ggRkQuCj4gICAyLiBJZiB0aGUgdGFyZ2V0IHBhdGggYmVn
aW5zIHdpdGggIi9kbWFidWYiLCB0aGVuIHRoZSBGRCBpcyBhIGRtYWJ1ZiBGRC4KPiAgIDMuIHN0
YXQgdGhlIGZpbGUgdG8gZ2V0IHRoZSBkbWFidWYgaW5vZGUgbnVtYmVyLgo+ICAgNC4gUmVhZC8g
cHJvYy88cGlkPi9mZGluZm8vPGZkPiwgdG8gZ2V0IHRoZSBETUEgYnVmZmVyIHNpemUuCj4KPiBB
bmRyb2lkIGNhcHR1cmVzIHBlci1wcm9jZXNzIHN5c3RlbSBtZW1vcnkgc3RhdGUgd2hlbiBjZXJ0
YWluIGxvdyBtZW1vcnkKPiBldmVudHMgKGUuZyBhIGZvcmVncm91bmQgYXBwIGtpbGwpIG9jY3Vy
LCB0byBpZGVudGlmeSBwb3RlbnRpYWwgbWVtb3J5Cj4gaG9nZ2Vycy4gVG8gaW5jbHVkZSBhIHBy
b2Nlc3PigJlzIGRtYWJ1ZiB1c2FnZSBhcyBwYXJ0IG9mIGl0cyBtZW1vcnkgc3RhdGUsCj4gdGhl
IGRhdGEgY29sbGVjdGlvbiBuZWVkcyB0byBiZSBmYXN0IGVub3VnaCB0byByZWZsZWN0IHRoZSBt
ZW1vcnkgc3RhdGUgYXQKPiB0aGUgdGltZSBvZiBzdWNoIGV2ZW50cy4KPgo+IFNpbmNlIHJlYWRp
bmcgL3Byb2MvPHBpZD4vZmQvIGFuZCAvcHJvYy88cGlkPi9mZGluZm8vIHJlcXVpcmVzIHJvb3QK
PiBwcml2aWxlZ2VzLCB0aGlzIGFwcHJvYWNoIGlzIG5vdCBzdWl0YWJsZSBmb3IgcHJvZHVjdGlv
biBidWlsZHMuCgpJdCBzaG91bGQgYmUgZWFzeSB0byBhZGQgZW5vdWdoIGluZm9ybWF0aW9uIHRv
IC9wcm9jLzxwaWQ+L2ZkaW5mby8gc28KdGhhdCB5b3UgZG9uJ3QgbmVlZCB0byBsb29rIGF0IC9w
cm9jLzxwaWQ+L2ZkLyBhbnltb3JlLgoKPiBHcmFudGluZwo+IHJvb3QgcHJpdmlsZWdlcyBldmVu
IHRvIGEgc3lzdGVtIHByb2Nlc3MgaW5jcmVhc2VzIHRoZSBhdHRhY2sgc3VyZmFjZSBhbmQKPiBp
cyBoaWdobHkgdW5kZXNpcmFibGUuIEFkZGl0aW9uYWxseSB0aGlzIGlzIHNsb3cgYXMgaXQgcmVx
dWlyZXMgbWFueQo+IGNvbnRleHQgc3dpdGNoZXMgZm9yIHNlYXJjaGluZyBhbmQgZ2V0dGluZyB0
aGUgZG1hLWJ1ZiBpbmZvLgoKV2hhdCBkbyB5b3UgbWVhbiBieSAiY29udGV4dCBzd2l0Y2hlcyI/
IFRhc2sgc3dpdGNoZXMgb3Iga2VybmVsL3VzZXIKdHJhbnNpdGlvbnMgKGUuZy4gdmlhIHN5c2Nh
bGwpPwoKPiBXaXRoIHRoZSBhZGRpdGlvbiBvZiBwZXItYnVmZmVyIGRtYWJ1ZiBzdGF0cyBpbiBz
eXNmcyBbMV0sIHRoZSBETUEgYnVmZmVyCj4gZGV0YWlscyBjYW4gYmUgcXVlcmllZCB1c2luZyB0
aGVpciB1bmlxdWUgaW5vZGUgbnVtYmVycy4KPgo+IFRoaXMgcGF0Y2ggcHJvcG9zZXMgYWRkaW5n
IGEgL3Byb2MvPHBpZD4vdGFzay88dGlkPi9kbWFidWZfZmRzIGludGVyZmFjZS4KPgo+IC9wcm9j
LzxwaWQ+L3Rhc2svPHRpZD4vZG1hYnVmX2ZkcyBjb250YWlucyBhIGxpc3Qgb2YgaW5vZGUgbnVt
YmVycyBmb3IKPiBldmVyeSBETUEgYnVmZmVyIEZEIHRoYXQgdGhlIHRhc2sgaGFzLiBFbnRyaWVz
IHdpdGggdGhlIHNhbWUgaW5vZGUKPiBudW1iZXIgY2FuIGFwcGVhciBtb3JlIHRoYW4gb25jZSwg
aW5kaWNhdGluZyB0aGUgdG90YWwgRkQgcmVmZXJlbmNlcwo+IGZvciB0aGUgYXNzb2NpYXRlZCBE
TUEgYnVmZmVyLgo+Cj4gSWYgYSB0aHJlYWQgc2hhcmVzIHRoZSBzYW1lIGZpbGVzIGFzIHRoZSBn
cm91cCBsZWFkZXIgdGhlbiBpdHMKPiBkbWFidWZfZmRzIGZpbGUgd2lsbCBiZSBlbXB0eSwgYXMg
dGhlc2UgZG1hYnVmcyBhcmUgcmVwb3J0ZWQgYnkgdGhlCj4gZ3JvdXAgbGVhZGVyLgo+Cj4gVGhl
IGludGVyZmFjZSByZXF1aXJlcyBQVFJBQ0VfTU9ERV9SRUFEX0ZTQ1JFRCAoc2FtZSBhcyAvcHJv
Yy88cGlkPi9tYXBzKQo+IGFuZCBhbGxvd3MgdGhlIGVmZmljaWVudCBhY2NvdW50aW5nIG9mIHBl
ci1wcm9jZXNzIERNQSBidWZmZXIgdXNhZ2Ugd2l0aG91dAo+IHJlcXVpcmluZyByb290IHByaXZp
bGVnZXMuIChTZWUgZGF0YSBiZWxvdykKCkknbSBub3QgY29udmluY2VkIHRoYXQgaW50cm9kdWNp
bmcgYSBuZXcgcHJvY2ZzIGZpbGUgZm9yIHRoaXMgaXMgdGhlCnJpZ2h0IHdheSB0byBnby4gQW5k
IHRoZSBpZGVhIG9mIGhhdmluZyB0byBwb2tlIGludG8gbXVsdGlwbGUKZGlmZmVyZW50IGZpbGVz
IGluIHByb2NmcyBhbmQgaW4gc3lzZnMganVzdCB0byBiZSBhYmxlIHRvIGNvbXB1dGUgYQpwcm9w
ZXIgbWVtb3J5IHVzYWdlIHNjb3JlIGZvciBhIHByb2Nlc3Mgc2VlbXMgd2VpcmQgdG8gbWUuICJI
b3cgbXVjaAptZW1vcnkgaXMgdGhpcyBwcm9jZXNzIHVzaW5nIiBzZWVtcyBsaWtlIHRoZSBraW5k
IG9mIHF1ZXN0aW9uIHRoZQprZXJuZWwgb3VnaHQgdG8gYmUgYWJsZSB0byBhbnN3ZXIgKGFuZCB0
aGUga2VybmVsIG5lZWRzIHRvIGJlIGFibGUgdG8KYW5zd2VyIHNvbWV3aGF0IGFjY3VyYXRlbHkg
c28gdGhhdCBpdHMgb3duIE9PTSBraWxsZXIgY2FuIGRvIGl0cyBqb2IKcHJvcGVybHkpPwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
