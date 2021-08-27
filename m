Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD2D3FA1CB
	for <lists+dri-devel@lfdr.de>; Sat, 28 Aug 2021 01:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11086E9E2;
	Fri, 27 Aug 2021 23:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B986E9E2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 23:27:13 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1997D3200940;
 Fri, 27 Aug 2021 19:27:10 -0400 (EDT)
Received: from imap7 ([10.202.2.57])
 by compute4.internal (MEProxy); Fri, 27 Aug 2021 19:27:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 amanoeldawod.com; h=mime-version:message-id:in-reply-to
 :references:date:from:to:cc:subject:content-type; s=fm2; bh=QyRS
 Iun6fxydAuUhiM2pCbzBCjpkmyN4k/4RPzoSViY=; b=G4f0PZL/ZHL1Z9xVH/Zc
 fF9Niw0rwAFOGaEPEOY68l12mP0HDFqEQy1yvqYOz1OY6BKTgAbgnq7fDknMgMmd
 iVuQsYiOM77zQ7Lq3ow1RrxDnNscU2CSTk0/D3wr0fjI0hoCzppeF5ZPnVKCMwox
 Se0NCbrWXCHR3ttNnTrgLtNtmfvEs3BXQsNuOcb9Jxc1d7NF7Vbp9PbQqoSlmssJ
 bXmZTwUMYn1PsVMFA1I8CyYLwdGMgAJZ0eZSvd08MY9YdOETWmzSG9AbrexEj9gx
 n65Fq83Glg8LNGQ0z2RrbwB/Wzc7Hp2KsIRMtf17zuBXYrJhMNNDZ5phB3hpuwVS
 eA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=QyRSIu
 n6fxydAuUhiM2pCbzBCjpkmyN4k/4RPzoSViY=; b=nRx/rsbDz5KxzFXceGl6DP
 kB3Rl6kdLJ9bO/lwgA0KsPkNSkbHugFFkEc6SsWMZ+aYSx/IKOGXTXXcCRi11xfk
 2YALlPuJsJGkc2JaXMvtkxEXwm7wbTpaj6PNPw7IE3SL9mA39FoSPx3GBMuU7VCj
 D0SJt/DZ+MfTUklcMqd5Av66MSjXzGVNePSGxzGMzqZDC8Dw6V8UXdxz1wqg0+qk
 DL+QQWjXYB+FYghWtb5El/AKp2CwY6cmnlqZXJ354CLy+PQNh+XBrNNFsrhBp0V7
 /pF+eZKDewnMraxgtQVEfwy6U5b7EHFqVb6kVqISb56fWQn7lo9M+kwUo6kBefAg
 ==
X-ME-Sender: <xms:zXQpYUpKYljgSKXP8ajX9PO7FjjukRQfK3c89xr2KbSxnK_UAjmq1w>
 <xme:zXQpYao5xuAKl--uSogCUxx71Wb3weXqpO2hFlUJnk8VuFV6AhO4sZDdq9cfbPmDe
 cHdzytKxhNoMWKPMzM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddugedgvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesmhdtreerreerjeenucfhrhhomhepfdetmhgr
 nhhovghlucffrgifohgufdcuoehkvghrnhgvlhesrghmrghnohgvlhgurgifohgurdgtoh
 hmqeenucggtffrrghtthgvrhhnpeevveevuedtjeekgeffjeegieeljeehhefgffejhfev
 heeuveejheejgfevtdefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehkvghrnhgvlhesrghmrghnohgvlhgurgifohgurdgtohhm
X-ME-Proxy: <xmx:zXQpYZOhTVgVPg_Xc5SadF1NsiUNR5YuJstmLkNv-IWY1jIHjLe9sQ>
 <xmx:zXQpYb5JnwqsHWqdn6weamRXj-btODMi9aztcE6rwTdKvASmf3C4iw>
 <xmx:zXQpYT7efp3Fe17yj9TgrIIWSoQEm4DeCeyCyORcbvEuo0tLfxYdIQ>
 <xmx:zXQpYcU3tHIgxQh0cc-4asNLavP6m72IWl5vs75bbCHFNMLr6btvbw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1EA5436014F; Fri, 27 Aug 2021 19:27:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1125-g685cec594c-fm-20210825.001-g685cec59
Mime-Version: 1.0
Message-Id: <a9839860-6e13-4809-9a85-96821ae5372e@www.fastmail.com>
In-Reply-To: <f80168a3-02e3-1c79-98e3-11b9f7573a6e@suse.de>
References: <5186020a-192f-4e04-adc2-25a34305fea6@www.fastmail.com>
 <e80ae664-7184-69dd-5e6e-e228c720bb85@suse.de>
 <2ec3ae15-e8d7-4db3-baef-04b8ab9dc467@www.fastmail.com>
 <e3343649-a96d-7306-67d0-5f8fc9427429@suse.de>
 <ab196ef1-44d5-4aef-a1ab-e43bed2a87e4@www.fastmail.com>
 <7486abc7-ce39-915f-b697-b9adb356f98f@suse.de>
 <4c161178-4d15-4ca6-9069-9c9a781c7019@www.fastmail.com>
 <f80168a3-02e3-1c79-98e3-11b9f7573a6e@suse.de>
Date: Fri, 27 Aug 2021 19:25:59 -0400
From: "Amanoel Dawod" <kernel@amanoeldawod.com>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?Q?Re:_drm:_simpledrm:_fbdev_emulation_error_with_CONFIG=5FDRM=5F?=
 =?UTF-8?Q?SIMPLEDRM_enabled?=
Content-Type: multipart/mixed;
 boundary=87b069a2ef144805a4539c1fbd8d85b7
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--87b069a2ef144805a4539c1fbd8d85b7
Content-Type: text/plain

Hi

On Thu, Aug 26, 2021, at 2:31 PM, Thomas Zimmermann wrote:
> 
> You said that the resolution is 3840 x 2160, but the attached log says 
> 1024x768. I guess that the former is the monitor's native resolution and 
> the latter is the display mode?
> 

Yes, that's the monitor native resolution and what I was running within Gnome
shell, but I believe since I'm now booting to text mode with only simpledrm
it reports 1024x768.

> The attached patch adds a few extra lines of debugging output. Could you 
> please apply it, rebuild, and report back with the log.
> 
> Best regards
> Thomas
> 

Sure, I applied the patch. Please find new dmesg output attached.

-- 
thanks,
Amanoel
--87b069a2ef144805a4539c1fbd8d85b7
Content-Disposition: attachment;filename="drm-extra-debug.txt"
Content-Type: text/plain; name="drm-extra-debug.txt"
Content-Transfer-Encoding: BASE64

WyAgICAyLjQ0MTU4N10gW2RybToweGZmZmZmZmZmYzAzNjcwY2NdIEluaXRpYWxpemVkClsg
ICAgMi40NDczNjhdIHNpbXBsZS1mcmFtZWJ1ZmZlciBzaW1wbGUtZnJhbWVidWZmZXIuMDog
W2RybToweGZmZmZmZmZmYzAzYWY2OWRdIGRpc3BsYXkgbW9kZT17IjEwMjR4NzY4IjogNjAw
MDAgNDcxODU5MjAgMTAyNCAxMDI0IDEwMjQgMTAyNCA3NjggNzY4IDc2OCA3NjggMHg0MCAw
eDB9ClsgICAgMi40NDczNzFdIHNpbXBsZS1mcmFtZWJ1ZmZlciBzaW1wbGUtZnJhbWVidWZm
ZXIuMDogW2RybToweGZmZmZmZmZmYzAzYWY2YzBdIGZyYW1lYnVmZmVyIGZvcm1hdD1BUjI0
IGxpdHRsZS1lbmRpYW4gKDB4MzQzMjUyNDEpLCBzaXplPTEwMjR4NzY4LCBzdHJpZGU9NDA5
NiBieXRlClsgICAgMi40NDczODhdIFtkcm06MHhmZmZmZmZmZmMwMzAzY2NiXSAKWyAgICAy
LjQ0NzM4OV0gW2RybToweGZmZmZmZmZmYzAzMDNlOTRdIApbICAgIDIuNDQ3NDEzXSBbZHJt
OjB4ZmZmZmZmZmZjMDMwM2VmOF0gbmV3IG1pbm9yIHJlZ2lzdGVyZWQgMApbICAgIDIuNDQ3
NDIwXSBbZHJtOjB4ZmZmZmZmZmZjMDMwNGM0OF0gYWRkaW5nICJVbmtub3duLTEiIHRvIHN5
c2ZzClsgICAgMi40NDc0MjFdIFtkcm06MHhmZmZmZmZmZmMwMzA0YWVhXSBnZW5lcmF0aW5n
IGhvdHBsdWcgZXZlbnQKWyAgICAyLjQ0NzQyM10gW2RybV0gSW5pdGlhbGl6ZWQgc2ltcGxl
ZHJtIDEuMC4wIDIwMjAwNjI1IGZvciBzaW1wbGUtZnJhbWVidWZmZXIuMCBvbiBtaW5vciAw
ClsgICAgMi40NDc0MjRdIFtkcm06MHhmZmZmZmZmZmMwMzMxMzk5XSAKWyAgICAyLjQ0NzQy
NV0gW2RybToweGZmZmZmZmZmYzAzMjAwZDFdIE9CSiBJRDogMzEgKDIpClsgICAgMi40NDc0
MjZdIFtkcm06MHhmZmZmZmZmZmMwMzgwMjYwXSBbQ09OTkVDVE9SOjMxOlVua25vd24tMV0K
WyAgICAyLjQ0NzQyN10gW2RybToweGZmZmZmZmZmYzAzODAzMzRdIFtDT05ORUNUT1I6MzE6
VW5rbm93bi0xXSBzdGF0dXMgdXBkYXRlZCBmcm9tIHVua25vd24gdG8gY29ubmVjdGVkClsg
ICAgMi40NDc0MzBdIFtkcm06MHhmZmZmZmZmZmMwMzgwNWM1XSBbQ09OTkVDVE9SOjMxOlVu
a25vd24tMV0gcHJvYmVkIG1vZGVzIDoKWyAgICAyLjQ0NzQzMV0gW2RybToweGZmZmZmZmZm
YzAzMDhiZTNdIE1vZGVsaW5lICIxMDI0eDc2OCI6IDYwMDAwIDQ3MTg1OTIwIDEwMjQgMTAy
NCAxMDI0IDEwMjQgNzY4IDc2OCA3NjggNzY4IDB4NDggMHgwClsgICAgMi40NDc0MzJdIFtk
cm06MHhmZmZmZmZmZmMwMzMxNjEzXSBjb25uZWN0b3IgMzEgZW5hYmxlZD8geWVzClsgICAg
Mi40NDc0MzNdIFtkcm06MHhmZmZmZmZmZmMwMzMxOWRkXSBOb3QgdXNpbmcgZmlybXdhcmUg
Y29uZmlndXJhdGlvbgpbICAgIDIuNDQ3NDM0XSBbZHJtOjB4ZmZmZmZmZmZjMDMzMWM0OV0g
bG9va2luZyBmb3IgY21kbGluZSBtb2RlIG9uIGNvbm5lY3RvciAzMQpbICAgIDIuNDQ3NDM0
XSBbZHJtOjB4ZmZmZmZmZmZjMDMzMjEzMV0gbG9va2luZyBmb3IgcHJlZmVycmVkIG1vZGUg
b24gY29ubmVjdG9yIDMxIDAKWyAgICAyLjQ0NzQzNV0gW2RybToweGZmZmZmZmZmYzAzMzFk
NDNdIGZvdW5kIG1vZGUgMTAyNHg3NjgKWyAgICAyLjQ0NzQzNV0gW2RybToweGZmZmZmZmZm
YzAzMzFmMWZdIHBpY2tpbmcgQ1JUQ3MgZm9yIDEwMjR4NzY4IGNvbmZpZwpbICAgIDIuNDQ3
NDM2XSBbZHJtOjB4ZmZmZmZmZmZjMDMzMjA2Yl0gZGVzaXJlZCBtb2RlIDEwMjR4NzY4IHNl
dCBvbiBjcnRjIDM0ICgwLDApClsgICAgMi40NDc0MzZdIFtkcm06MHhmZmZmZmZmZmMwMzIw
MGQxXSBPQkogSUQ6IDMxICgyKQpbICAgIDIuNDQ3NDM3XSBbZHJtOjB4ZmZmZmZmZmZjMDMy
MDE4MV0gT0JKIElEOiAzMSAoMykKWyAgICAyLjQ0NzQzN10gc2ltcGxlLWZyYW1lYnVmZmVy
IHNpbXBsZS1mcmFtZWJ1ZmZlci4wOiBbZHJtOjB4ZmZmZmZmZmZjMDM5NGRjN10gdGVzdCBD
UlRDIDAgcHJpbWFyeSBwbGFuZQpbICAgIDIuNDQ3NDM4XSBbZHJtOjB4ZmZmZmZmZmZjMDM5
NGVjNF0gKkVSUk9SKiB4PTAgeT0wLCBkZXNpcmVkX21vZGUtPmhkaXNwbGF5PTEwMjQgZGVz
aXJlZF9tb2RlLT52ZGlzcGxheT0xMDI0IHNpemVzLnN1cmZhY2Vfd2lkdGg9NzY4IHNpemVz
LnN1cmZhY2VfaGVpZ2h0PTc2OApbICAgIDIuNDQ3NDM5XSBbZHJtOjB4ZmZmZmZmZmZjMDM5
NGYwM10gKkVSUk9SKiBjb25uZWN0b3ItPmhhc190aWxlPTAKWyAgICAyLjQ0NzQ0MF0gc2lt
cGxlLWZyYW1lYnVmZmVyIHNpbXBsZS1mcmFtZWJ1ZmZlci4wOiBbZHJtOjB4ZmZmZmZmZmZj
MDM5N2NiYV0gc3VyZmFjZSB3aWR0aCgxMDI0KSwgaGVpZ2h0KDIzMDQpIGFuZCBicHAoMzIp
ClsgICAgMi40NDc0NDNdIFtkcm06MHhmZmZmZmZmZmMwMzFiNDgzXSBiYWQgZnJhbWVidWZm
ZXIgaGVpZ2h0IDIzMDQsIHNob3VsZCBiZSA+PSA3NjggJiYgPD0gNzY4ClsgICAgMi40NDc0
NDVdIHNpbXBsZS1mcmFtZWJ1ZmZlciBzaW1wbGUtZnJhbWVidWZmZXIuMDogW2RybV0gKkVS
Uk9SKiBmYmRldjogRmFpbGVkIHRvIHNldHVwIGdlbmVyaWMgZW11bGF0aW9uIChyZXQ9LTIy
KQpbICAgIDIuNDQ3NDQ2XSBzaW1wbGUtZnJhbWVidWZmZXIgc2ltcGxlLWZyYW1lYnVmZmVy
LjA6IFtkcm06MHhmZmZmZmZmZmMwMzk2OGRlXSBjbGllbnQgaG90cGx1ZyByZXQ9LTIyClsg
ICAxNC42Mjk5OTVdIHN5c3RlbWRbMV06IFN0YXJ0aW5nIExvYWQgS2VybmVsIE1vZHVsZSBk
cm0uLi4KWyAgIDE0LjYzNDM1Nl0gc3lzdGVtZFsxXTogbW9kcHJvYmVAZHJtLnNlcnZpY2U6
IERlYWN0aXZhdGVkIHN1Y2Nlc3NmdWxseS4KWyAgIDE0LjYzNDQyMV0gc3lzdGVtZFsxXTog
RmluaXNoZWQgTG9hZCBLZXJuZWwgTW9kdWxlIGRybS4K

--87b069a2ef144805a4539c1fbd8d85b7--
