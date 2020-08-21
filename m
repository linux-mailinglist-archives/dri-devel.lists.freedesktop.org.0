Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F83B24E2D5
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 23:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82846EC0D;
	Fri, 21 Aug 2020 21:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986256EC0D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 21:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598046478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1WdXRvG4bCNhwZSZkTWr9Rx/+hCL+T87J2kS4FEJuzY=;
 b=SX7OfXt520eDJ543onznE47MsEWOX6pXAQRrVJGFllohrttjKWE3FMhipYNKkMomXXpktc
 wBx5KDTMCASuvPI83DXf+tLwiB1+UmPKeAWmH9PYpNKV4H8tF6YdSdMUI+IdAAvbh5blwN
 KtpSOLCVoRp0Xg61xU3NoTyvrpvWBuY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-SAp0EwLqMC6y5pmLPLYV_Q-1; Fri, 21 Aug 2020 17:46:49 -0400
X-MC-Unique: SAp0EwLqMC6y5pmLPLYV_Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34F87801AB9;
 Fri, 21 Aug 2020 21:46:44 +0000 (UTC)
Received: from [10.36.112.5] (ovpn-112-5.ams2.redhat.com [10.36.112.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE76410013D0;
 Fri, 21 Aug 2020 21:46:34 +0000 (UTC)
Subject: Re: [PATCH v4 00/23] device-dax: Support sub-dividing soft-reserved
 ranges
To: Dan Williams <dan.j.williams@intel.com>
References: <CAPcyv4gTJgZ0jM3oRM8Exs7MKwyNHF5yWNceAFrX7k8KfFcBig@mail.gmail.com>
 <646DDE9B-90C2-493A-958C-90EFA1CCA475@redhat.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 WNyWQQ==
Organization: Red Hat GmbH
Message-ID: <6cee1e57-7b7e-f8b6-2c53-f913b18926c0@redhat.com>
Date: Fri, 21 Aug 2020 23:46:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <646DDE9B-90C2-493A-958C-90EFA1CCA475@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@ozlabs.org>, Linux MM <linux-mm@kvack.org>,
 Michael Ellerman <mpe@ellerman.id.au>, "H. Peter Anvin" <hpa@zytor.com>,
 Joao Martins <joao.m.martins@oracle.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Linux ACPI <linux-acpi@vger.kernel.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 Vishal Verma <vishal.l.verma@intel.com>, X86 ML <x86@kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Jeff Moyer <jmoyer@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Ira Weiny <ira.weiny@intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Jia He <justin.he@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wei Yang <richardw.yang@linux.intel.com>, Brice Goglin <Brice.Goglin@inria.fr>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjEuMDguMjAgMjM6MzMsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+IAo+IAo+PiBBbSAy
MS4wOC4yMDIwIHVtIDIzOjE3IHNjaHJpZWIgRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0Bp
bnRlbC5jb20+Ogo+Pgo+PiDvu79PbiBGcmksIEF1ZyAyMSwgMjAyMCBhdCAxMTozMCBBTSBEYXZp
ZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4+Pgo+Pj4+IE9uIDIxLjA4
LjIwIDIwOjI3LCBEYW4gV2lsbGlhbXMgd3JvdGU6Cj4+Pj4gT24gRnJpLCBBdWcgMjEsIDIwMjAg
YXQgMzoxNSBBTSBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4+
Pj4+Cj4+Pj4+Pj4KPj4+Pj4+PiAxLiBPbiB4ODYtNjQsIGU4MjAgaW5kaWNhdGVzICJzb2Z0LXJl
c2VydmVkIiBtZW1vcnkuIFRoaXMgbWVtb3J5IGlzIG5vdAo+Pj4+Pj4+IGF1dG9tYXRpY2FsbHkg
dXNlZCBpbiB0aGUgYnVkZHkgZHVyaW5nIGJvb3QsIGJ1dCByZW1haW5zIHVudG91Y2hlZAo+Pj4+
Pj4+IChzaW1pbGFyIHRvIHBtZW0pLiBCdXQgYXMgaXQgaW52b2x2ZXMgQUNQSSBhcyB3ZWxsLCBp
dCBjb3VsZCBhbHNvIGJlCj4+Pj4+Pj4gdXNlZCBvbiBhcm02NCAoLWU4MjApLCBjb3JyZWN0Pwo+
Pj4+Pj4KPj4+Pj4+IENvcnJlY3QsIGFybTY0IGFsc28gZ2V0cyB0aGUgRUZJIHN1cHBvcnQgZm9y
IGVudW1lcmF0aW5nIG1lbW9yeSB0aGlzCj4+Pj4+PiB3YXkuIEhvd2V2ZXIsIEkgd291bGQgY2xh
cmlmeSB0aGF0IHdoZXRoZXIgc29mdC1yZXNlcnZlZCBpcyBnaXZlbiB0bwo+Pj4+Pj4gdGhlIGJ1
ZGR5IGFsbG9jYXRvciBieSBkZWZhdWx0IG9yIG5vdCBpcyB0aGUga2VybmVsJ3MgcG9saWN5IGNo
b2ljZSwKPj4+Pj4+ICJidWRkeS1ieS1kZWZhdWx0IiBpcyBvayBhbmQgaXMgd2hhdCB3aWxsIGhh
cHBlbiBhbnl3YXlzIHdpdGggb2xkZXIKPj4+Pj4+IGtlcm5lbHMgb24gcGxhdGZvcm1zIHRoYXQg
ZW51bWVyYXRlIGEgbWVtb3J5IHJhbmdlIHRoaXMgd2F5Lgo+Pj4+Pgo+Pj4+PiBJcyAic29mdC1y
ZXNlcnZlZCIgdGhlbiB0aGUgcmlnaHQgdGVybWlub2xvZ3kgZm9yIHRoYXQ/IEl0IHNvdW5kcyB2
ZXJ5Cj4+Pj4+IHg4Ni02NC9lODIwIHNwZWNpZmljLiBNYXliZSBhIGNvbXByZXNzZWQgZm9yIG9m
ICJwZXJmb3JtYW5jZQo+Pj4+PiBkaWZmZXJlbnRpYXRlZCBtZW1vcnkiIG1pZ2h0IGJlIGEgYmV0
dGVyIGZpdCB0byBleHBvc2UgdG8gdXNlciBzcGFjZSwgbm8/Cj4+Pj4KPj4+PiBOby4gVGhlIEVG
SSAiU3BlY2lmaWMgUHVycG9zZSIgYml0IGlzIGFuIGF0dHJpYnV0ZSBpbmRlcGVuZGVudCBvZgo+
Pj4+IGU4MjAsIGl0J3MgeDg2LUxpbnV4IHRoYXQgZW50YW5nbGVzIHRob3NlIHRvZ2V0aGVyLiBU
aGVyZSBpcyBubwo+Pj4+IHJlcXVpcmVtZW50IGZvciBwbGF0Zm9ybSBmaXJtd2FyZSB0byB1c2Ug
dGhhdCBkZXNpZ25hdGlvbiBldmVuIGZvcgo+Pj4+IGRyYXN0aWMgcGVyZm9ybWFuY2UgZGlmZmVy
ZW50aWF0aW9uIGJldHdlZW4gcmFuZ2VzLCBhbmQgY29udmVyc2VseQo+Pj4+IHRoZXJlIGlzIG5v
IHJlcXVpcmVtZW50IHRoYXQgbWVtb3J5ICp3aXRoKiB0aGF0IGRlc2lnbmF0aW9uIGhhcyBhbnkK
Pj4+PiBwZXJmb3JtYW5jZSBkaWZmZXJlbmNlIGNvbXBhcmVkIHRvIHRoZSBkZWZhdWx0IG1lbW9y
eSBwb29sLiBTbyBpdAo+Pj4+IHJlYWxseSBpcyBhIHJlc2VydmF0aW9uIHBvbGljeSBhYm91dCBh
IG1lbW9yeSByYW5nZSB0byBrZWVwIG91dCBvZiB0aGUKPj4+PiBidWRkeSBhbGxvY2F0b3IgYnkg
ZGVmYXVsdC4KPj4+Cj4+PiBPa2F5LCBzdGlsbCAic29mdC1yZXNlcnZlZCIgaXMgeDg2LTY0IHNw
ZWNpZmljLCBubz8KPj4KPj4gVGhlcmUncyBub3RoaW5nIHByZXZlbnRpbmcgb3RoZXIgRUZJIGFy
Y2hzLCBvciBhIHNpbWlsYXIgZGVzaWduYXRpb24KPj4gaW4gYW5vdGhlciBmaXJtd2FyZSBzcGVj
LCBwaWNraW5nIHVwIHRoaXMgcG9saWN5Lgo+Pgo+Pj4gIChBRkFJSywKPj4+ICJzb2Z0LXJlc2Vy
dmVkIiB3aWxsIGJlIHZpc2libGUgaW4gL3Byb2MvaW9tZW0sIG9yIGFtIEkgY29uZnVzaW5nCj4+
PiBzdHVmZj8pCj4+Cj4+IE5vLCB5b3UncmUgY29ycmVjdC4KPj4KPj4+IElPVywgaXQgInBlcmZv
cm1hbmNlIGRpZmZlcmVudGlhdGVkIiBpcyBub3QgdW5pdmVyc2FsbHkKPj4+IGFwcGxpY2FibGUs
IG1heWJlICAic3BlY2lmaWMgcHVycG9zZSBtZW1vcnkiIGlzID8KPj4KPj4gVGhvc2UgYmlrZXNo
ZWQgY29sb3JzIGRvbid0IHNlZW0gYW4gaW1wcm92ZW1lbnQgdG8gbWUuCj4+Cj4+ICJTb2Z0LXJl
c2VydmVkIiBhY3R1YWxseSB0ZWxscyB5b3Ugc29tZXRoaW5nIGFib3V0IHRoZSBrZXJuZWwgcG9s
aWN5Cj4+IGZvciB0aGUgbWVtb3J5LiBUaGUgY3JpdGljaXNtIG9mICJzcGVjaWZpYyBwdXJwb3Nl
IiB0aGF0IGxlZCB0bwo+PiBjYWxsaW5nIGl0ICJzb2Z0LXJlc2VydmVkIiBpbiBMaW51eCBpcyB0
aGUgZmFjdCB0aGF0ICJzcGVjaWZpYyIgaXMKPj4gdW5kZWZpbmVkIGFzIGZhciBhcyB0aGUgZmly
bXdhcmUga25vd3MsIGFuZCAic3BlY2lmaWMiIG1heSBoYXZlCj4+IGRpZmZlcmVudCBhcHBsaWNh
dGlvbnMgYmFzZWQgb24gdGhlIHBsYXRmb3JtIHVzZXIuICJTb2Z0LXJlc2VydmVkIgo+PiBsaWtl
ICJSZXNlcnZlZCIgdGVsbHMgeW91IHRoYXQgYSBkcml2ZXIgcG9saWN5IG1pZ2h0IGJlIGluIHBs
YXkgZm9yCj4+IHRoYXQgbWVtb3J5Lgo+Pgo+PiBBbHNvIG5vdGUgdGhhdCB0aGUgY3VycmVudCBj
b2xvciBvZiB0aGUgYmlrZXNoZWQgaGFzIGFscmVhZHkgc2hpcHBlZCBzaW5jZSB2NS41Ogo+Pgo+
PiAgIDI2MmI0NWFlM2FiNCB4ODYvZWZpOiBFRkkgc29mdCByZXNlcnZhdGlvbiB0byBFODIwIGVu
dW1lcmF0aW9uCj4+Cj4gCj4gSSB3YXMgYXNraW5nIGJlY2F1c2UgSSB3YXMgc3RydWdnbGluZyB0
byBldmVuIHVuZGVyc3RhbmQgd2hhdCDigJ5zb2Z0LXJlc2VydmVk4oCcIGlzIGFuZCBJIGNvdWxk
IGJldCBtb3N0IHBlb3BsZSBoYXZlIG5vIGNsdWUgd2hhdCB0aGF0IGlzIHN1cHBvc2VkIHRvIGJl
Lgo+IAo+IEluIGNvbnRyYXN0IOKAnnBlcnNpc3RlbnQgbWVtb3J54oCcIG9yIOKAnnNwZWNpYWwg
cHVycG9zZSBtZW1vcnnigJwgaW4gL3Byb2MvaW9tZW0gaXMgc29tZXRoaW5nIG5vcm1hbCAoTGlu
dXggdXNpbmcpIGh1bWFuIGJlaW5ncyBjYW4gdW5kZXJzdGFuZC4KCnMvbm9ybWFsL21vc3QvICwg
c2hvdWxkbid0IGJlIHdyaXRpbmcgZW1haWxzIGZyb20gbXkgc21hcnRwaG9uZS4gQ2hlZXJzIQoK
Ci0tIApUaGFua3MsCgpEYXZpZCAvIGRoaWxkZW5iCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
