Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C676B107166
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 12:31:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C0C6F52F;
	Fri, 22 Nov 2019 11:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 463996F531
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 11:31:11 +0000 (UTC)
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-UJ9MdNhLNtyRE04btTG3PA-1; Fri, 22 Nov 2019 06:31:04 -0500
Received: by mail-qv1-f70.google.com with SMTP id b1so4498293qvm.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 03:31:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Aur9rsWegbHLh3oY6ky2CGYiseXs+N84XUMnQYfdl6g=;
 b=rIAU+WePowbZUh5SgZOt8Xd8qyePXpAa5jcI/kfQdu/A+gcaItwpvHZijtPdpu10u+
 FTUaKvj/MDk1v2/QvNWtp7HvHEhocindJkXPFl8PPQ7CGM7GFCTGUVRDllMyvXHAwTK6
 RP26lmnGz8Kv8H4f4sqQu1m23YvWzK2SAqe/+i/PRyxJUoK3s6crZGk1FCi51Xa1JMSF
 2T01zmaiMqPq3ocOH1d6OE2KSSLwrslT69N/9nHhNcKdX3jDb68PfTusEaW7agrNhtgN
 4KuAh0CjODemxF8TlbrtE28HedxPa60lJkhgEmug7gLajwJpxigy3nHjZVprEJdjxHkI
 VSHA==
X-Gm-Message-State: APjAAAVmtytie/G9K/0GHsxM+MdX07BS73S1P/SkLscvUiwjjQoa5Efh
 +nUcwb7U8MHkRIWnB8KHRGC7X9BzoGaS0fwUXPHR3bBuw/S8nR8ypiQLtkvl03csbm1oZRO6C0o
 biOKkJTvk6LikBbw8k85aiYvg6lbJ5RYhMXl8d+amcSvj
X-Received: by 2002:ac8:5557:: with SMTP id o23mr13894112qtr.378.1574422264298; 
 Fri, 22 Nov 2019 03:31:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqz4tUnanEcz7OF5qm09oSIPeTrgesqROQcAYMdb3VQX3IrvgvC0XjOQgTAq+ByslNwLSUis/BX58JFkAfiwgdw=
X-Received: by 2002:ac8:5557:: with SMTP id o23mr13894072qtr.378.1574422264060; 
 Fri, 22 Nov 2019 03:31:04 -0800 (PST)
MIME-Version: 1.0
References: <CACO55tvo3rbPtYJcioEgXCEQqVXcVAm-iowr9Nim=bgTdMjgLw@mail.gmail.com>
 <20191120155301.GL11621@lahna.fi.intel.com>
 <CAJZ5v0hkT-fHFOQKzp2qYPyR+NUa4c-G-uGLPZuQxqsG454PiQ@mail.gmail.com>
 <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
 <CAJZ5v0h=7zu3A+ojgUSmwTH0KeXmYP5OKDL__rwkkWaWqcJcWQ@mail.gmail.com>
 <20191121112821.GU11621@lahna.fi.intel.com>
 <CAJZ5v0hQhj5Wf+piU11abC4pF26yM=XHGHAcDv8Jsgdx04aN-w@mail.gmail.com>
 <20191121114610.GW11621@lahna.fi.intel.com>
 <20191121125236.GX11621@lahna.fi.intel.com>
 <CAJZ5v0iMwhudB7O0hR-6KfRfa+_iGOY=t0Zzeh6+9OiTzeYJfA@mail.gmail.com>
 <20191121194942.GY11621@lahna.fi.intel.com>
 <CAJZ5v0gyna0b135uxBVfNXgB9v-U9-93EYe0uzsr2BukJ9OtuA@mail.gmail.com>
 <CACO55tvFeTFo3gGdL02gnWMMk+AHPPb=hntkre0ZcA6WvKcV1A@mail.gmail.com>
 <CACO55tvkQyYYnCs71_nJuNFm4f8kkvBqje8WeZGph7X+2zO3aA@mail.gmail.com>
 <CAJZ5v0jNq77xPXxeYeq_JJBCfekVPVPOye1mZwpQi=+=MKSS7w@mail.gmail.com>
In-Reply-To: <CAJZ5v0jNq77xPXxeYeq_JJBCfekVPVPOye1mZwpQi=+=MKSS7w@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 22 Nov 2019 12:30:52 +0100
Message-ID: <CACO55tue979AjxXO0MsOMVzUYvVaLh3rMDVg43=kqz=-OpW3Jw@mail.gmail.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
To: "Rafael J. Wysocki" <rafael@kernel.org>
X-MC-Unique: UJ9MdNhLNtyRE04btTG3PA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574422270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fk7+9wRBOnitbINGrkgws0BRV6i2F3wIBf4jxMH1Ew8=;
 b=PjU/zwZcbUKB3DZyMu/Ouatzj4jkGDoKDh41bHxvRRkyCr5UbkrcPuTeN+NVTopyVNAhno
 Q6MsdizMQkULvYniLD0khvXZIT+06MoKMpMiCFcEDAA8l/VgU5p8Q56eMTOknNaECMYdDy
 ixYPZN3drhhi0dRntEYvH3GqbuoOUGE=
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
Cc: Linux PM <linux-pm@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@intel.com>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMTA6MDcgQU0gUmFmYWVsIEouIFd5c29ja2kgPHJhZmFl
bEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgTm92IDIyLCAyMDE5IGF0IDE6MTMgQU0g
S2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4KPiA+IHNvIHdoaWxl
IHRyeWluZyB0byB0ZXN0IHdpdGggZDNjb2xkIGRpc2FibGVkLCBJIG5vdGljZWQgdGhhdCBJIHJ1
bgo+ID4gaW50byB0aGUgZXhhY3Qgc2FtZSBlcnJvci4KPgo+IERvZXMgdGhpcyBtZWFuIHRoYXQg
eW91IGRpc2FibGVkIGQzY29sZCBvbiB0aGUgR1BVIHZpYSBzeXNmcyAodGhlCj4gImQzY29sZF9h
bGxvd2VkIiBhdHRyaWJ1dGUgd2FzIDApIGFuZCB0aGUgb3JpZ2luYWwgcHJvYmxlbSBzdGlsbAo+
IG9jY3VycmVkIGluIHRoYXQgY29uZmlndXJhdGlvbj8KPgoKeWVzLiBJbiBteSBwcmV2aW91cyB0
ZXN0aW5nIEkgd2FzIHBva2luZyBpbnRvIHRoZSBQQ0kgcmVnaXN0ZXJzIG9mIHRoZQpicmlkZ2Ug
Y29udHJvbGxlciBhbmQgdGhlIEdQVSBkaXJlY3RseSBhbmQgdGhhdCBuZXZlciBjYXVzZWQgYW55
Cmlzc3VlcyBhcyBsb25nIGFzIEkgbGltaXRlZCBpdCB0byBwdXR0aW5nIHRoZSBkZXZpY2VzIGlu
dG8gRDNob3QuCgo+ID4gQW5kIEkgdmVyaWZpZWQgdGhhdCB0aGUKPiA+IFxfU0IuUENJMC5QRUcw
LlBHMDAuX1NUQSByZXR1cm5zIDEsIHdoaWNoIGluZGljYXRlcyBpdCBzaG91bGQgc3RpbGwgYmUK
PiA+IHR1cm5lZCBvbi4KPgo+IEkgZG9uJ3QgcmVhbGx5IHVuZGVyc3RhbmQgdGhpcyBjb21tZW50
LCBzbyBjYW4geW91IGV4cGxhaW4gaXQgYSBiaXQgdG8KPiBtZSwgcGxlYXNlPwo+Cgp0aGF0J3Mg
dGhlIEFDUEkgbWV0aG9kIHRvIGZldGNoIHRoZSAic3RhdHVzIiBvZiB0aGUgcG93ZXIgcmVzb3Vy
Y2UsIGl0CnNob3VsZCByZXR1cm4gMCB3aGVuIHRoZSBkZXZpY2Ugd2FzIHBvd2VyZWQgb2ZmICh0
aGUgR1BVKSBhbmQgMQpvdGhlcndpc2UuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
