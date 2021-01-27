Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D90230712A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:18:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0946E921;
	Thu, 28 Jan 2021 08:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588C16E865
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 17:16:35 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id u67so1616023pfb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 09:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eZkRAFReyCaCfsUebKjqhppx54eZqZXUA8gRquKcsPU=;
 b=dimGUWBu88dX8OdBPtqV1K4RlZBNMOe3qLaj2DFeriW0zXGvfLXQdvpDQW90G+pq8w
 p6xdN0AtXLBzz2oPtDzXqxZIr8psZaQU+lB+nDni6Zl/WIpcblkhLxycbxPAvV8te05i
 KsVIp+ePdyQmOMOK1htw20UOkkjeFnjUvviVoIEY2ofKY9lhBjfLrheC8MM/6mQmKGDo
 lgZrbx94cvm3t6pqu1kCexYTDa1cFG519/QRDEJtzXaZ7GklAYFE3S3JdLgmQXJO7Olf
 5tbc9e9YBFuaJlg9N990aaa1pAzjhautowBMkQc84YuILgD85YeIKeYhHvbjucdynQoo
 2yeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eZkRAFReyCaCfsUebKjqhppx54eZqZXUA8gRquKcsPU=;
 b=OT6ds0bz33HODgYhxu05sfNHKjBOIVZxKDN/QAcDfn93T6WWtJvdXjjT99870L3koc
 svZ3+b8/bG8RV12ZTjWqpt5/NzR3+C+f6agMK3RNjHRHf4Hht9HyYH+TPtoYNa0eOF73
 msy9uzPD3KHyYSA7clzDm1yPocPOcr8Om0buSv2jq56NcLENDLjvFbanP3knWdvw8pZX
 qmC20KXOmdpWmo/I0H+3jjmQ5fXyyQIP+KznLCq3mg+yAYnNP/SaTEJRpNMIJsFvf+rF
 vrr+SY6lLCzRCBt0mTszoNz4Nlh/m/Fmk6AEN+BUlnzNBB9VJKOK6hChfIS8RCnEbrKb
 ZfLA==
X-Gm-Message-State: AOAM5320qlC8zmHsL++O6ag2jtNCjiYjk+1G3Iqn4yODWuPRAAcbNCRz
 OYtmpbaGMY2e+OaYnAHHgMtZd3GclkBRVLNCBhdDAg==
X-Google-Smtp-Source: ABdhPJxKQ8+LIsyyI6CfO9fy/6S4KtVkebVD7Kd1qkb+yv7kQN6fPglxpJCY+HhjUK+MV4uOLoP/VTT9u1mKmJvI5fg=
X-Received: by 2002:a63:724a:: with SMTP id c10mr10790208pgn.124.1611767794770; 
 Wed, 27 Jan 2021 09:16:34 -0800 (PST)
MIME-Version: 1.0
References: <20210126225138.1823266-1-kaleshsingh@google.com>
 <CAG48ez2tc_GSPYdgGqTRotUp6NqFoUKdoN_p978+BOLoD_Fdjw@mail.gmail.com>
In-Reply-To: <CAG48ez2tc_GSPYdgGqTRotUp6NqFoUKdoN_p978+BOLoD_Fdjw@mail.gmail.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Wed, 27 Jan 2021 12:16:23 -0500
Message-ID: <CAC_TJvfuFiDSWD+ud_rJJ6zFQjYhcK1Rfqyrne4OBB4ZfJ0oMQ@mail.gmail.com>
Subject: Re: [PATCH] procfs/dmabuf: Add /proc/<pid>/task/<tid>/dmabuf_fds
To: Jann Horn <jannh@google.com>
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
 Szabolcs Nagy <szabolcs.nagy@arm.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
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

T24gV2VkLCBKYW4gMjcsIDIwMjEgYXQgNTo0NyBBTSBKYW5uIEhvcm4gPGphbm5oQGdvb2dsZS5j
b20+IHdyb3RlOgo+Cj4gK2plZmZ2IGZyb20gQW5kcm9pZAo+Cj4gT24gVHVlLCBKYW4gMjYsIDIw
MjEgYXQgMTE6NTEgUE0gS2FsZXNoIFNpbmdoIDxrYWxlc2hzaW5naEBnb29nbGUuY29tPiB3cm90
ZToKPiA+IEluIG9yZGVyIHRvIG1lYXN1cmUgaG93IG11Y2ggbWVtb3J5IGEgcHJvY2VzcyBhY3R1
YWxseSBjb25zdW1lcywgaXQgaXMKPiA+IG5lY2Vzc2FyeSB0byBpbmNsdWRlIHRoZSBETUEgYnVm
ZmVyIHNpemVzIGZvciB0aGF0IHByb2Nlc3MgaW4gdGhlIG1lbW9yeQo+ID4gYWNjb3VudGluZy4g
U2luY2UgdGhlIGhhbmRsZSB0byBETUEgYnVmZmVycyBhcmUgcmF3IEZEcywgaXQgaXMgaW1wb3J0
YW50Cj4gPiB0byBiZSBhYmxlIHRvIGlkZW50aWZ5IHdoaWNoIHByb2Nlc3NlcyBoYXZlIEZEIHJl
ZmVyZW5jZXMgdG8gYSBETUEgYnVmZmVyLgo+Cj4gT3IgeW91IGNvdWxkIHRyeSB0byBsZXQgdGhl
IERNQSBidWZmZXIgdGFrZSBhIHJlZmVyZW5jZSBvbiB0aGUKPiBtbV9zdHJ1Y3QgYW5kIGFjY291
bnQgaXRzIHNpemUgaW50byB0aGUgbW1fc3RydWN0PyBUaGF0IHdvdWxkIHByb2JhYmx5Cj4gYmUg
bmljZXIgdG8gd29yayB3aXRoIHRoYW4gaGF2aW5nIHRvIHBva2UgYXJvdW5kIGluIHByb2NmcyBz
ZXBhcmF0ZWx5Cj4gZm9yIERNQSBidWZmZXJzLgo+Cj4gPiBDdXJyZW50bHksIERNQSBidWZmZXIg
RkRzIGNhbiBiZSBhY2NvdW50ZWQgdXNpbmcgL3Byb2MvPHBpZD4vZmQvKiBhbmQKPiA+IC9wcm9j
LzxwaWQ+L2ZkaW5mbyAtLSBib3RoIG9mIHdoaWNoIGFyZSBvbmx5IHJvb3QgcmVhZGFibGUsIGFz
IGZvbGxvd3M6Cj4KPiBUaGF0J3Mgbm90IHF1aXRlIHJpZ2h0LiBUaGV5IGNhbiBib3RoIGFsc28g
YmUgYWNjZXNzZWQgYnkgdGhlIHVzZXIKPiBvd25pbmcgdGhlIHByb2Nlc3MuIEFsc28sIGZkaW5m
byBpcyBhIHN0YW5kYXJkIGludGVyZmFjZSBmb3IKPiBpbnNwZWN0aW5nIHByb2Nlc3Mgc3RhdGUg
dGhhdCBkb2Vzbid0IHBlcm1pdCByZWFkaW5nIHByb2Nlc3MgbWVtb3J5IG9yCj4gbWFuaXB1bGF0
aW5nIHByb2Nlc3Mgc3RhdGUgLSBzbyBJIHRoaW5rIGl0IHdvdWxkIGJlIGZpbmUgdG8gcGVybWl0
Cj4gYWNjZXNzIHRvIGZkaW5mbyB1bmRlciBhIFBUUkFDRV9NT0RFX1JFQURfRlNDUkVEIGNoZWNr
LCBqdXN0IGxpa2UgdGhlCj4gaW50ZXJmYWNlIHlvdSdyZSBzdWdnZXN0aW5nLgoKCkhpIGV2ZXJ5
b25lLiBUaGFuayB5b3UgZm9yIHRoZSBmZWVkYmFjay4KCkkgdW5kZXJzdGFuZCB0aGVyZSBpcyBh
IGRlZXBlciBwcm9ibGVtIG9mIGFjY291bnRpbmcgc2hhcmVkIG1lbW9yeSBpbgp0aGUga2VybmVs
LCB0aGF04oCZcyBub3Qgb25seSBzcGVjaWZpYyB0byB0aGUgRE1BIGJ1ZmZlcnMuIEluIHRoaXMg
Y2FzZQpETUEgYnVmZmVycywgSSB0aGluayBKYW5u4oCZcyBwcm9wb3NhbCBpcyB0aGUgY2xlYW5l
c3Qgd2F5IHRvIGF0dHJpYnV0ZQp0aGUgc2hhcmVkIGJ1ZmZlcnMgdG8gcHJvY2Vzc2VzLiBJIGNh
biByZXNwaW4gYSBwYXRjaCBtb2RpZnlpbmcgZmRpbmZvCmFzIHN1Z2dlc3RlZCwgaWYgdGhpcyBp
cyBub3QgYW4gaXNzdWUgZnJvbSBhIHNlY3VyaXR5IHBlcnNwZWN0aXZlLgoKVGhhbmtzLApLYWxl
c2gKCj4KPgo+ID4gICAxLiBEbyBhIHJlYWRsaW5rIG9uIGVhY2ggRkQuCj4gPiAgIDIuIElmIHRo
ZSB0YXJnZXQgcGF0aCBiZWdpbnMgd2l0aCAiL2RtYWJ1ZiIsIHRoZW4gdGhlIEZEIGlzIGEgZG1h
YnVmIEZELgo+ID4gICAzLiBzdGF0IHRoZSBmaWxlIHRvIGdldCB0aGUgZG1hYnVmIGlub2RlIG51
bWJlci4KPiA+ICAgNC4gUmVhZC8gcHJvYy88cGlkPi9mZGluZm8vPGZkPiwgdG8gZ2V0IHRoZSBE
TUEgYnVmZmVyIHNpemUuCj4gPgo+ID4gQW5kcm9pZCBjYXB0dXJlcyBwZXItcHJvY2VzcyBzeXN0
ZW0gbWVtb3J5IHN0YXRlIHdoZW4gY2VydGFpbiBsb3cgbWVtb3J5Cj4gPiBldmVudHMgKGUuZyBh
IGZvcmVncm91bmQgYXBwIGtpbGwpIG9jY3VyLCB0byBpZGVudGlmeSBwb3RlbnRpYWwgbWVtb3J5
Cj4gPiBob2dnZXJzLiBUbyBpbmNsdWRlIGEgcHJvY2Vzc+KAmXMgZG1hYnVmIHVzYWdlIGFzIHBh
cnQgb2YgaXRzIG1lbW9yeSBzdGF0ZSwKPiA+IHRoZSBkYXRhIGNvbGxlY3Rpb24gbmVlZHMgdG8g
YmUgZmFzdCBlbm91Z2ggdG8gcmVmbGVjdCB0aGUgbWVtb3J5IHN0YXRlIGF0Cj4gPiB0aGUgdGlt
ZSBvZiBzdWNoIGV2ZW50cy4KPiA+Cj4gPiBTaW5jZSByZWFkaW5nIC9wcm9jLzxwaWQ+L2ZkLyBh
bmQgL3Byb2MvPHBpZD4vZmRpbmZvLyByZXF1aXJlcyByb290Cj4gPiBwcml2aWxlZ2VzLCB0aGlz
IGFwcHJvYWNoIGlzIG5vdCBzdWl0YWJsZSBmb3IgcHJvZHVjdGlvbiBidWlsZHMuCj4KPiBJdCBz
aG91bGQgYmUgZWFzeSB0byBhZGQgZW5vdWdoIGluZm9ybWF0aW9uIHRvIC9wcm9jLzxwaWQ+L2Zk
aW5mby8gc28KPiB0aGF0IHlvdSBkb24ndCBuZWVkIHRvIGxvb2sgYXQgL3Byb2MvPHBpZD4vZmQv
IGFueW1vcmUuCj4KPiA+IEdyYW50aW5nCj4gPiByb290IHByaXZpbGVnZXMgZXZlbiB0byBhIHN5
c3RlbSBwcm9jZXNzIGluY3JlYXNlcyB0aGUgYXR0YWNrIHN1cmZhY2UgYW5kCj4gPiBpcyBoaWdo
bHkgdW5kZXNpcmFibGUuIEFkZGl0aW9uYWxseSB0aGlzIGlzIHNsb3cgYXMgaXQgcmVxdWlyZXMg
bWFueQo+ID4gY29udGV4dCBzd2l0Y2hlcyBmb3Igc2VhcmNoaW5nIGFuZCBnZXR0aW5nIHRoZSBk
bWEtYnVmIGluZm8uCj4KPiBXaGF0IGRvIHlvdSBtZWFuIGJ5ICJjb250ZXh0IHN3aXRjaGVzIj8g
VGFzayBzd2l0Y2hlcyBvciBrZXJuZWwvdXNlcgo+IHRyYW5zaXRpb25zIChlLmcuIHZpYSBzeXNj
YWxsKT8KPgo+ID4gV2l0aCB0aGUgYWRkaXRpb24gb2YgcGVyLWJ1ZmZlciBkbWFidWYgc3RhdHMg
aW4gc3lzZnMgWzFdLCB0aGUgRE1BIGJ1ZmZlcgo+ID4gZGV0YWlscyBjYW4gYmUgcXVlcmllZCB1
c2luZyB0aGVpciB1bmlxdWUgaW5vZGUgbnVtYmVycy4KPiA+Cj4gPiBUaGlzIHBhdGNoIHByb3Bv
c2VzIGFkZGluZyBhIC9wcm9jLzxwaWQ+L3Rhc2svPHRpZD4vZG1hYnVmX2ZkcyBpbnRlcmZhY2Uu
Cj4gPgo+ID4gL3Byb2MvPHBpZD4vdGFzay88dGlkPi9kbWFidWZfZmRzIGNvbnRhaW5zIGEgbGlz
dCBvZiBpbm9kZSBudW1iZXJzIGZvcgo+ID4gZXZlcnkgRE1BIGJ1ZmZlciBGRCB0aGF0IHRoZSB0
YXNrIGhhcy4gRW50cmllcyB3aXRoIHRoZSBzYW1lIGlub2RlCj4gPiBudW1iZXIgY2FuIGFwcGVh
ciBtb3JlIHRoYW4gb25jZSwgaW5kaWNhdGluZyB0aGUgdG90YWwgRkQgcmVmZXJlbmNlcwo+ID4g
Zm9yIHRoZSBhc3NvY2lhdGVkIERNQSBidWZmZXIuCj4gPgo+ID4gSWYgYSB0aHJlYWQgc2hhcmVz
IHRoZSBzYW1lIGZpbGVzIGFzIHRoZSBncm91cCBsZWFkZXIgdGhlbiBpdHMKPiA+IGRtYWJ1Zl9m
ZHMgZmlsZSB3aWxsIGJlIGVtcHR5LCBhcyB0aGVzZSBkbWFidWZzIGFyZSByZXBvcnRlZCBieSB0
aGUKPiA+IGdyb3VwIGxlYWRlci4KPiA+Cj4gPiBUaGUgaW50ZXJmYWNlIHJlcXVpcmVzIFBUUkFD
RV9NT0RFX1JFQURfRlNDUkVEIChzYW1lIGFzIC9wcm9jLzxwaWQ+L21hcHMpCj4gPiBhbmQgYWxs
b3dzIHRoZSBlZmZpY2llbnQgYWNjb3VudGluZyBvZiBwZXItcHJvY2VzcyBETUEgYnVmZmVyIHVz
YWdlIHdpdGhvdXQKPiA+IHJlcXVpcmluZyByb290IHByaXZpbGVnZXMuIChTZWUgZGF0YSBiZWxv
dykKPgo+IEknbSBub3QgY29udmluY2VkIHRoYXQgaW50cm9kdWNpbmcgYSBuZXcgcHJvY2ZzIGZp
bGUgZm9yIHRoaXMgaXMgdGhlCj4gcmlnaHQgd2F5IHRvIGdvLiBBbmQgdGhlIGlkZWEgb2YgaGF2
aW5nIHRvIHBva2UgaW50byBtdWx0aXBsZQo+IGRpZmZlcmVudCBmaWxlcyBpbiBwcm9jZnMgYW5k
IGluIHN5c2ZzIGp1c3QgdG8gYmUgYWJsZSB0byBjb21wdXRlIGEKPiBwcm9wZXIgbWVtb3J5IHVz
YWdlIHNjb3JlIGZvciBhIHByb2Nlc3Mgc2VlbXMgd2VpcmQgdG8gbWUuICJIb3cgbXVjaAo+IG1l
bW9yeSBpcyB0aGlzIHByb2Nlc3MgdXNpbmciIHNlZW1zIGxpa2UgdGhlIGtpbmQgb2YgcXVlc3Rp
b24gdGhlCj4ga2VybmVsIG91Z2h0IHRvIGJlIGFibGUgdG8gYW5zd2VyIChhbmQgdGhlIGtlcm5l
bCBuZWVkcyB0byBiZSBhYmxlIHRvCj4gYW5zd2VyIHNvbWV3aGF0IGFjY3VyYXRlbHkgc28gdGhh
dCBpdHMgb3duIE9PTSBraWxsZXIgY2FuIGRvIGl0cyBqb2IKPiBwcm9wZXJseSk/Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
