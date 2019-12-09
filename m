Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 188E91168C0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 09:58:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9270D6E069;
	Mon,  9 Dec 2019 08:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1548 seconds by postgrey-1.36 at gabe;
 Mon, 09 Dec 2019 08:58:50 UTC
Received: from s02.spamexperts.axc.nl (s02.spamexperts.axc.nl [185.182.56.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638A16E069
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 08:58:50 +0000 (UTC)
Received: from vserver22.axc.nl ([185.182.56.82])
 by s02.spamexperts.axc.nl with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89)
 (envelope-from <info@dantalion.nl>) id 1ieETQ-00012e-L4
 for dri-devel@lists.freedesktop.org; Mon, 09 Dec 2019 09:32:59 +0100
Received: from mail.axc.nl ([185.182.56.42])
 by vserver22.axc.nl with esmtp (Exim 4.92)
 (envelope-from <info@dantalion.nl>) id 1ieETC-004rSR-7F
 for dri-devel@lists.freedesktop.org; Mon, 09 Dec 2019 09:32:46 +0100
To: dri-devel@lists.freedesktop.org
From: "info@dantalion.nl" <info@dantalion.nl>
Subject: i915 GPU HANG: 9:0:0x0, hang on rcs0 but can't report bug
Message-ID: <e38fc8f1-9476-afd1-64b9-7d7387e1ccfe@dantalion.nl>
Date: Mon, 9 Dec 2019 09:34:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Language: en-US
PrimaryMX: Accepted email from trusted host. Hint: This skips spam scanning so
 make sure other host is not vulnerable
SPFCheck: Server passes SPF test, -30 Spam score
X-Relay-Host: 185.182.56.42
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "vserver22.axc.nl", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello everyone, This is my first message on this mailing list
 so bear with me. I am running an Arch based system with kernel 5.3.x,
 xorg-server
 1.20.5 and xf86-video-intel 1:2.99.917. Recently I have been receiving GPU
 HANGS were my screen and mouse freeze for several seconds at a time. looking
 in dmesg I get the following: 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: freedesktop.org]
SpamTally: Final spam score: -30
X-AuthUser: 
X-Originating-IP: 185.182.56.82
X-SpamExperts-Domain: vserver22.axc.nl
X-SpamExperts-Username: 185.182.56.82
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.34)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0fi3oD8HEy9ysrsB6Ile+oipSDasLI4SayDByyq9LIhVhOBrKJlgmRje
 46fnbSIlj0TNWdUk1Ol2OGx3IfrIJKywOmJyM1qr8uRnWBrbSAGDsdaHa2yIxNHcdTgF5lNsIBob
 qQdXskLOLrCajKHcubXEV6mG7REFdc/y+N+WUcRUB1BYW9jIA3vHdacIOgZC9/q2Gb7u1BCYlN7N
 u1YChzu5cEt3QSU508Q6A7wRhsaYdmq9xo0GjtWFBExS79GWRWqPrI5F7ca2q4IiQVsDYsYigr59
 rlmv/GHWoLSyMb15MKAk8SysHk27iftfc7Mh1fW+Kq8NO/ThECzoIMrjlQOS9uL0ESCKvhZjy9pI
 axdG6rrhWhvRq69CH1q8nrrh6VZN2SMTs/uIHzL0p9RV3Ld2KiUIa5yU7gCNIxc3sng8A1aO0ASg
 ODHLSquIn2D3FxUS9itywBHw11Tnbe8A27oGYDuqIkOCXRe+PnbpVMssAV7Q9dPt/mgOpt8kNtyB
 HCVcELQQtiNPeM1gpDNTUPstjEbRrFHvESnMqzLGulVotOWjR7vVQidrBSxUUU6VX/vg7iEFLP+S
 SY+Av5+AiC6cwa9bmg707Pa/ItOLEwr5W1GSpvcMaYhPCPy+gi3dODhbjdBGI4hCNBIeYcF5LmSJ
 iGbjmnDjovYBkZJ/Px4HKenv/vjSXBvhjGyGeF9/SHuXCC1A5Cukky0WFo38JXT3Y80OmAux3oN1
 3+ztUzneeTp5lZXknezDoTn3hlivcAI+1D3d9PHYEd91N69czp7/MseBgBEwv/wQ/ZP1E26+pVlM
 PoOrMJqemF4PSN2eG7thzc3ac/iwu8pubAZAIsL8N8OIyLHQkuOeVSpv4FmV9R/2gMGq0KWAzmMf
 +ibVDjS0JOxsWCX/se7flViJCusUNlMli4/VajkV2pHN/PWYDU2H0KiSOfr3vDI/0nWLFq+IOO/3
 V6jRRnz1I3SOF+W2XhkGbmsUNPNkere1WheNk5OB7ACKw2V6Ydr3HqWVko10eVcFQThNE6ZcxYjW
 kr8=
X-Report-Abuse-To: spam@s01.spamexperts.axc.nl
X-Mailman-Original-Authentication-Results: spamexperts.axc.nl; auth=pass
 smtp.auth=185.182.56.82@vserver22.axc.nl
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gZXZlcnlvbmUsCgpUaGlzIGlzIG15IGZpcnN0IG1lc3NhZ2Ugb24gdGhpcyBtYWlsaW5n
IGxpc3Qgc28gYmVhciB3aXRoIG1lLiBJIGFtCnJ1bm5pbmcgYW4gQXJjaCBiYXNlZCBzeXN0ZW0g
d2l0aCBrZXJuZWwgNS4zLngsIHhvcmctc2VydmVyIDEuMjAuNSBhbmQKeGY4Ni12aWRlby1pbnRl
bCAxOjIuOTkuOTE3LgoKUmVjZW50bHkgSSBoYXZlIGJlZW4gcmVjZWl2aW5nIEdQVSBIQU5HUyB3
ZXJlIG15IHNjcmVlbiBhbmQgbW91c2UgZnJlZXplCmZvciBzZXZlcmFsIHNlY29uZHMgYXQgYSB0
aW1lLiBsb29raW5nIGluIGRtZXNnIEkgZ2V0IHRoZSBmb2xsb3dpbmc6CgppOTE1IDAwMDA6MDA6
MDIuMDogR1BVIEhBTkc6IGVjb2RlIDk6MDoweDAwMDAwMDAwLCBoYW5nIG9uIHJjczAKW2RybV0g
R1BVIGhhbmdzIGNhbiBpbmRpY2F0ZSBhIGJ1ZyBhbnl3aGVyZSBpbiB0aGUgZW50aXJlIGdmeCBz
dGFjaywKaW5jbHVkaW5nIHVzZXJzcGFjZS4KW2RybV0gUGxlYXNlIGZpbGUgYSBfbmV3XyBidWcg
cmVwb3J0IG9uIGJ1Z3MuZnJlZWRlc2t0b3Aub3JnIGFnYWluc3QgRFJJCi0+IERSTS9JbnRlbApb
ZHJtXSBkcm0vaTkxNSBkZXZlbG9wZXJzIGNhbiB0aGVuIHJlYXNzaWduIHRvIHRoZSByaWdodCBj
b21wb25lbnQgaWYKaXQncyBub3QgYSBrZXJuZWwgaXNzdWUuCltkcm1dIFRoZSBncHUgY3Jhc2gg
ZHVtcCBpcyByZXF1aXJlZCB0byBhbmFseXplIGdwdSBoYW5ncywgc28gcGxlYXNlCmFsd2F5cyBh
dHRhY2ggaXQuCltkcm1dIEdQVSBjcmFzaCBkdW1wIHNhdmVkIHRvIC9zeXMvY2xhc3MvZHJtL2Nh
cmQxL2Vycm9yCgpJIHNhdmVkIHRoZSBvdXRwdXQgdG8gYSBmaWxlIGFuZCBwcm9jZWVkZWQgdG8g
bWFrZSBhbiBhY2NvdW50IG9uIHRoZQp3ZWJzaXRlIG1lbnRpb25lZC4gQnV0IG5vdyBJIGFtIHVu
YWJsZSB0byBjcmVhdGUgYSBidWcgcmVwb3J0IGJlaW5nCmdyZWV0ZWQgYnkgYSBtZXNzYWdlICJF
aXRoZXIgbm8gcHJvZHVjdHMgaGF2ZSBiZWVuIGRlZmluZWQgdG8gZW50ZXIgYnVncwphZ2FpbnN0
IG9yIHlvdSBoYXZlIG5vdCBiZWVuIGdpdmVuIGFjY2VzcyB0byBhbnkuIgoKSG93IGRvIEkgcHJv
Y2VlZCBhbHRlcm5hdGl2ZWx5IEkgY2FuIGVtYWlsIHRoZSBkdW1wIGZpbGUgYW5kIHNvbWVvbmUK
d2l0aCB0aGUgYXBwcm9wcmlhdGUgcGVybWlzc2lvbnMgY2FuIHJlcG9ydCBpdCBmb3IgbWUuCgpL
aW5kIHJlZ2FyZHMsCkNvcm5lIEx1a2tlbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
