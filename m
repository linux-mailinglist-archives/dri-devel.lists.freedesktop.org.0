Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0404F92FC
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 15:48:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B466E486;
	Tue, 12 Nov 2019 14:48:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1801 seconds by postgrey-1.36 at gabe;
 Tue, 12 Nov 2019 14:48:30 UTC
Received: from blackstar.xs4all.nl (blackstar.xs4all.nl [83.163.96.30])
 by gabe.freedesktop.org (Postfix) with ESMTP id E69BC6E486
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 14:48:30 +0000 (UTC)
Received: from [192.168.3.139] (usg [192.168.3.254])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 by blackstar.xs4all.nl (Postfix) with ESMTP id 286B93501F0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 15:18:22 +0100 (CET)
To: dri-devel@lists.freedesktop.org
From: Bas Vermeulen <bvermeul@blackstar.nl>
Subject: How to create a drm_display_mode for a new display
Message-ID: <36fff77b-1e11-7faa-1c31-3fc719a4d354@blackstar.nl>
Date: Tue, 12 Nov 2019 15:18:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
X-blackstar.nl-MailScanner-Information: Please contact the ISP for more
 information
X-blackstar.nl-MailScanner-ID: 286B93501F0.AB619
X-blackstar.nl-MailScanner: Found to be clean
X-blackstar.nl-MailScanner-From: bvermeul@blackstar.nl
X-Spam-Status: No
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpJIGFtIHRyeWluZyB0byBjcmVhdGUgYSBuZXcgZGlzcGxheSBtb2RlIGZvciBhIG5l
dyBkaXNwbGF5IEkgaGF2ZSB0byAKc3VwcG9ydC4KCkkgaGF2ZSB0aGUgZm9sbG93aW5nIGluZm9y
bWF0aW9uOgoKRG90Y2xvY2sgLSBmcmVxdWVuY3kgcGVyaW9kIC0gMS9UQ0xQIC0gODkuNiBNSHoK
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgVENEUCAtIDExLDE2IG5zCgpIc3luYyAtIFBlcmlvZCAtIFRIIC0gMjA0OCBkb3RjbG9jaywg
NDMsNzUgS0h6LCAyMiw4NiB1cwogwqDCoMKgwqDCoMKgwqAgUHVsc2UgV2lkdGggLSBUSHAgLSA0
MCBkb3RjbG9jaywgMCw0NSB1cyAtIGFjdGl2ZSBsb3csIHN5bmMgCnB1bHNlIGhpZ2gsIHBvbGFy
aXR5KwoKVnN5bmMgLSBQZXJpb2QgLSBUViAtIDcyOSBkb3RjbG9jaywgNjAgSHosIDE2LDY2IG1z
CiDCoMKgwqDCoMKgwqDCoCBQdWxzZSBXaWR0aCAtIFRWcCAtIDIgbGluZSwgNDUsNzIgdXMgLSBh
Y3RpdmUgbG93LCBzeW5jIHB1bHNlIApoaWdoLCBwb2xhcml0eSsKCkVuYWJsZSAtIFB1bHNlIFdp
ZHRoIC0gVEhkIC0gMTkyMCBkb3RjbG9jawoKViBEaXNwbGF5IC0gVGVybSAtIFRWZCAtIDcyMCBs
aW5lCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFN0YXJ0IC0gVEZkIC0gNSBsaW5lCgpQaGFzZSAt
IEhzeW5jLUVuYWJsZSAtIFRIZSAtIDg4IGRvdGNsb2NrCiDCoMKgwqDCoMKgwqDCoCBIc3luYy1W
c3luYyAtIFRWaCAtIDAgZG90Y2xvY2sKCkkgbWFkZSB0aGUgZm9sbG93aW5nIGRybV9kaXNwbGF5
X21vZGUgb3V0IG9mIGl0OgoKeyBEUk1fTU9ERSgiMTkyMHg3MjAiLCBEUk1fTU9ERV9UWVBFX0RS
SVZFUiwgODk2MDAsIDE5MjAsIDE5MjAsCiDCoMKgwqDCoMKgwqDCoMKgIDE5NjAsIDIwNDgsIDAs
IDcyMCwgNzIyLCA3MjQsIDcyOSwgMCwKIMKgwqDCoMKgwqDCoMKgwqAgRFJNX01PREVfRkxBR19O
SFNZTkMgfCBEUk1fTU9ERV9GTEFHX05WU1lOQyksCiDCoMKgwqDCoMKgwqDCoMKgIC52cmVmcmVz
aCA9IDYwLCAucGljdHVyZV9hc3BlY3RfcmF0aW8gPSAKSERNSV9QSUNUVVJFX0FTUEVDVF8xNl85
LCB9LAoKQW0gSSBpbnRlcnByZXRpbmcgdGhlIHNwZWNpZmljYXRpb25zIGNvcnJlY3RseT8gVGhl
IGRpc3BsYXkgaXMgdW5hYmxlIHRvIApoYW5kbGUgdGhlIHNpZ25hbCBJIGFtIGN1cnJlbnRseSBz
ZW5kaW5nLCBzbyBzb21ldGhpbmcgaXMgd3JvbmcuCgpCYXMgVmVybWV1bGVuCgoKLS0gClRoaXMg
bWVzc2FnZSBoYXMgYmVlbiBzY2FubmVkIGZvciB2aXJ1c2VzIGFuZApkYW5nZXJvdXMgY29udGVu
dCBieSBNYWlsU2Nhbm5lciwgYW5kIGlzCmJlbGlldmVkIHRvIGJlIGNsZWFuLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
