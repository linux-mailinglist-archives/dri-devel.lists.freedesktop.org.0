Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC97F96EC
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 18:19:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF946EB8F;
	Tue, 12 Nov 2019 17:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277676EB8A;
 Tue, 12 Nov 2019 17:19:18 +0000 (UTC)
Received: from localhost (unknown [69.71.4.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C6C2520659;
 Tue, 12 Nov 2019 17:19:17 +0000 (UTC)
Date: Tue, 12 Nov 2019 11:19:15 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH 1/2] drm: replace incorrect Compliance/Margin magic
 numbers with PCI_EXP_LNKCTL2 definitions
Message-ID: <20191112171915.GA167243@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6d86246e-504a-b762-aff8-0449dd6f3d31@daenzer.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573579158;
 bh=85dgABjfLst0EJiLfQ6UppL83HD41+jlwGeYc+PJi5s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=xdL+G1zDFE46caLzbkDRg0br9X96M7qfTympBm/tlAae7Dosfy8oNmO241YvCY3ot
 o/AK0tQcwpY1drq9ZXLTRTg83BCM/T44eZYlb5MREr/qYT9bAmbRggcZgaxXabvtMW
 jK+xizZQdMqOiW5ALdmPKCHortPXcRVIeEtOVC2I=
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
Cc: Frederick Lawler <fred@fredlawl.com>, David Airlie <airlied@linux.ie>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMDU6NDU6MTVQTSArMDEwMCwgTWljaGVsIETDpG56ZXIg
d3JvdGU6Cj4gT24gMjAxOS0xMS0xMSA4OjI5IHAubS4sIEJqb3JuIEhlbGdhYXMgd3JvdGU6Cj4g
PiBGcm9tOiBCam9ybiBIZWxnYWFzIDxiaGVsZ2Fhc0Bnb29nbGUuY29tPgo+ID4gCj4gPiBBZGQg
ZGVmaW5pdGlvbnMgZm9yIHRoZXNlIFBDSWUgTGluayBDb250cm9sIDIgcmVnaXN0ZXIgZmllbGRz
Ogo+ID4gCj4gPiAgIEVudGVyIENvbXBsaWFuY2UKPiA+ICAgVHJhbnNtaXQgTWFyZ2luCj4gPiAK
PiA+IGFuZCB1c2UgdGhlbSBpbiBhbWRncHUgYW5kIHJhZGVvbi4KPiA+IAo+ID4gTk9URTogVGhp
cyBpcyBhIGZ1bmN0aW9uYWwgY2hhbmdlIGJlY2F1c2UgIjcgPDwgOSIgd2FzIGFwcGFyZW50bHkg
YSB0eXBvLgo+ID4gVGhhdCBtYXNrIGluY2x1ZGVkIHRoZSBoaWdoIG9yZGVyIGJpdCBvZiBUcmFu
c21pdCBNYXJnaW4sIHRoZSBFbnRlcgo+ID4gTW9kaWZpZWQgQ29tcGxpYW5jZSBiaXQsIGFuZCB0
aGUgQ29tcGxpYW5jZSBTT1MgYml0LCBidXQgSSB0aGluayB3aGF0Cj4gPiB3YXMgaW50ZW5kZWQg
d2FzIHRoZSAzLWJpdCBUcmFuc21pdCBNYXJnaW4gZmllbGQgYXQgYml0cyA5OjcuCj4gCj4gQ2Fu
IHlvdSBzcGxpdCBvdXQgdGhlIGZ1bmN0aW9uYWwgY2hhbmdlIGludG8gYSBzZXBhcmF0ZSBwYXRj
aCAxPyBUaGF0Cj4gY291bGQgbWFrZSB0aGluZ3MgZWFzaWVyIGZvciBhbnlvbmUgd2hvIGJpc2Vj
dHMgdGhlIGZ1bmN0aW9uYWwgY2hhbmdlCj4gZm9yIHdoYXRldmVyIHJlYXNvbi4KCkdyZWF0IGlk
ZWEsIHRoYW5rcyEgIFdpc2ggSSdkIHRob3VnaHQgb2YgdGhhdC4KCldoaWxlIGZpeGluZyB0aGF0
LCBJIGFsc28gbm90aWNlZCBJIG1pc3NlZCBvbmUgY2FzZSBpbgphbWRncHUvc2kuYy4gIEknbGwg
cG9zdCBhIHYzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
