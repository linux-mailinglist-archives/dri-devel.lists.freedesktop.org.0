Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C21871FCF
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 14:11:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EEF4112AB8;
	Tue,  5 Mar 2024 13:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net
 (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
 by gabe.freedesktop.org (Postfix) with ESMTP id 62E11112AB9;
 Tue,  5 Mar 2024 13:11:05 +0000 (UTC)
Received: from duoming$zju.edu.cn ( [106.117.76.127] ) by
 ajax-webmail-mail-app2 (Coremail) ; Tue, 5 Mar 2024 21:08:49 +0800
 (GMT+08:00)
X-Originating-IP: [106.117.76.127]
Date: Tue, 5 Mar 2024 21:08:49 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: duoming@zju.edu.cn
To: "Jani Nikula" <jani.nikula@linux.intel.com>
Cc: "Timur Tabi" <timur@kernel.org>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] nouveau/dmem: handle kcalloc() allocation failure
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT5 build
 20231205(37e20f0e) Copyright (c) 2002-2024 www.mailtech.cn
 mispb-4df6dc2c-e274-4d1c-b502-72c5c3dfa9ce-zj.edu.cn
In-Reply-To: <87y1ay42ir.fsf@intel.com>
References: <20240303081330.61091-1-duoming@zju.edu.cn>
 <CAOZdJXUebAScPBjJdCbdzzA_Hmotk11bd7MvLLxe+pqS5-upHQ@mail.gmail.com>
 <87y1ay42ir.fsf@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <601512f5.b287.18e0ebb25d4.Coremail.duoming@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: by_KCgDHB6dhGedle0e7Ag--.8664W
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwULAWXmGFMTDgAAsZ
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
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

T24gTW9uLCAwNCBNYXIgMjAyNCAxNDoxNDo1MiArMDIwMCBKYW5pIE5pa3VsYSB3cm90ZToKPiA+
PiBUaGUga2NhbGxvYygpIGluIG5vdXZlYXVfZG1lbV9ldmljdF9jaHVuaygpIHdpbGwgcmV0dXJu
IG51bGwgaWYKPiA+PiB0aGUgcGh5c2ljYWwgbWVtb3J5IGhhcyBydW4gb3V0LiBBcyBhIHJlc3Vs
dCwgaWYgd2UgZGVyZWZlcmVuY2UKPiA+PiBzcmNfcGZucywgZHN0X3BmbnMgb3IgZG1hX2FkZHJz
LCB0aGUgbnVsbCBwb2ludGVyIGRlcmVmZXJlbmNlIGJ1Z3MKPiA+PiB3aWxsIGhhcHBlbi4KPiA+
Pgo+ID4+IFRoaXMgcGF0Y2ggdXNlcyBzdGFjayB2YXJpYWJsZXMgdG8gcmVwbGFjZSB0aGUga2Nh
bGxvYygpLgo+ID4KPiA+IFdvbid0IHRoaXMgYmxvdyB0aGUgc3RhY2s/ICBBbmQgd2h5IG5vdCBq
dXN0IHRlc3QgdGhlIHJldHVybiB2YWx1ZSBvZgo+ID4ga2NhbGxvYz8KPiAKPiBWTEFzIHNob3Vs
ZCBub3QgYmUgdXNlZCBpbiB0aGUga2VybmVsIGFueW1vcmUuIEJ1aWxkaW5nIHRoaXMgcmVzdWx0
cyBpbgo+IGEgd2FybmluZyBkdWUgdG8gLVd2bGEuIFNlZSAwYmI5NWY4MGEzOGYgKCJNYWtlZmls
ZTogR2xvYmFsbHkgZW5hYmxlIFZMQQo+IHdhcm5pbmciKS4KPiAKPiBFcnJvciBjaGVja2luZyBh
bmQgcHJvcGFnYXRpb24gaXMgdGhlIHdheSB0byBnby4KClRoZSBHUFUgaXMgZ29pbmcgYXdheS4g
SWYgdGhlIGtjYWxsb2MoKSBpbiBub3V2ZWF1X2RtZW1fZXZpY3RfY2h1bmsoKSBmYWlsLAp3ZSBj
b3VsZCBub3QgZXZpY3QgYWxsIHBhZ2VzIG1hcHBpbmcgYSBjaHVuay4gRG8geW91IHRoaW5rIHdl
IHNob3VsZCBhZGQgYQpfX0dGUF9OT0ZBSUwgZmxhZyBpbiBrY2FsbG9jKCk/IEkgc2VlIHRoZSBf
X0dGUF9OT0ZBSUwgZmxhZyBpcyB1c2VkIGluIHRoZQpmb2xsb3dpbmcgY29kZToKCi8qCiogX0dG
UF9OT0ZBSUwgYmVjYXVzZSB0aGUgR1BVIGlzIGdvaW5nIGF3YXkgYW5kIHRoZXJlCiogaXMgbm90
aGluZyBzZW5zaWJsZSB3ZSBjYW4gZG8gaWYgd2UgY2FuJ3QgY29weSB0aGUKKiBkYXRhIGJhY2su
CiovCmRwYWdlID0gYWxsb2NfcGFnZShHRlBfSElHSFVTRVIgfCBfX0dGUF9OT0ZBSUwpOwoKQmVz
dCByZWdhcmRzLApEdW9taW5nIFpob3UK
