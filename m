Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8EDB4A772
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 11:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51ECE10E1AA;
	Tue,  9 Sep 2025 09:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hooskbmT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1F310E1AA
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 09:21:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C55E260224;
 Tue,  9 Sep 2025 09:21:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F1AC4CEF4;
 Tue,  9 Sep 2025 09:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757409675;
 bh=+fjZF0QJCtGrNgwDrzLzgfzno6BjOTwzlpPUW4bFHxA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hooskbmT9NXIM5er/vkbZ83teoaLKRtTVsqQOdgZs2T0MtkdmKAvFQfoqCdOR4NrT
 y29cBS7c00Rzf6Qfuz3M5UWgvmW5Qk+0EfonnR250/WuKcvWw2RnSWEg9MRmnyvHFs
 OorBYvXmKyzBWno52fsSddvh/fJVaWpKzR8qPEE8nhz1bBFe+E7c9GptiJyTMxw84k
 wQOH6qzBDX0gn2Yay0gfebf7+IPDEu3AuNBCiOoHhlEdLhdo+jn8GLrGyjkmczKEkx
 tdc9xfJTnyxaY+GoxM2zOX9Tyl9KYi4iLo9xYADnQaMwsxgsVTg0vwUAbZQ/NqMABg
 +8bq+ocHLxQug==
Content-Type: multipart/mixed; boundary="------------Ks5pXm1R52GZGS5sYHOnm0Kr"
Message-ID: <bde582df-9522-48ae-9d84-fa3751c4a06d@kernel.org>
Date: Tue, 9 Sep 2025 11:21:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: leds: commonize leds property
To: Rob Herring <robh@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
 <20250908-leds-v3-2-5944dc400668@vinarskis.com>
 <0e030e7d-0a1a-4a00-ba18-ed26107d07fa@oss.qualcomm.com>
 <046b289d-b6a5-45f9-88b1-090e2ab7c95d@kernel.org>
 <39b955b9-a152-458a-8e09-908efebaaccd@oss.qualcomm.com>
 <20250908222247.GA1943768-robh@kernel.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20250908222247.GA1943768-robh@kernel.org>
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

This is a multi-part message in MIME format.
--------------Ks5pXm1R52GZGS5sYHOnm0Kr
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

On 9-Sep-25 12:22 AM, Rob Herring wrote:
> On Mon, Sep 08, 2025 at 09:36:39AM +0200, Konrad Dybcio wrote:
>> On 9/8/25 9:33 AM, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 8-Sep-25 09:20, Konrad Dybcio wrote:
>>>> On 9/8/25 1:18 AM, Aleksandrs Vinarskis wrote:
>>>>> A number of existing schemas use 'leds' property to provide
>>>>> phandle-array of LED(s) to the consumer. Additionally, with the
>>>>> upcoming privacy-led support in device-tree, v4l2 subnode could be a
>>>>> LED consumer, meaning that all camera sensors should support 'leds'
>>>>> and 'led-names' property via common 'video-interface-devices.yaml'.
>>>>>
>>>>> To avoid dublication, commonize 'leds' property from existing schemas
>>>>> to newly introduced 'led-consumer.yaml'.
>>>>>
>>>>> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>>  
>>>>> +  leds:
>>>>> +    minItems: 1
>>>>> +    maxItems: 1
>>>>
>>>> My brain compiler suggests this will throw a warning (minItems should
>>>> be redundant in this case)
>>>>> +
>>>>> +  led-names:
>>>>> +    enum:
>>>>> +      - privacy-led
>>>>
>>>> Nit: "privacy" makes more sense without the suffix, as we inherently
>>>> know this is supposed to be an LED
>>>
>>> Note "privacy-led" as name is already used on the x86/ACPI side and
>>> the code consuming this will be shared.
>>>
>>> With that said if there is a strong preference for going with just
>>> "privacy" the x86 side can be adjusted since the provider-info is
>>> generated through a LED lookup table on the x86/ACPI side. So we can
>>> just modify both the lookup table generation as well as the already
>>> existing led_get(dev, "privacy-led") call to use just "privacy"
>>> without problems.
>>
>> In that case, it may be cleaner to just go with what we have today
>> (unless the dt maintainers have stronger opinions)
> 
> Well, I do, but I guess it's fine. Please don't add the suffix on the 
> rest and add a comment for why it's there.

As mentioned dropping the "-led" suffix is no big deal for the ACPI
side and if we don't want the suffix then IMHO we should just drop
it rather then making an exception here.

Attached are 2 patches which drop the suffix on the ACPI side.

If people agree with dropping the suffix I'll officially submit these
upstream.

Regards,

Hans

--------------Ks5pXm1R52GZGS5sYHOnm0Kr
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-platform-x86-int3472-Use-privacy-as-con_id-for-the-L.patch"
Content-Disposition: attachment;
 filename*0="0001-platform-x86-int3472-Use-privacy-as-con_id-for-the-L.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBkOThkNjBiMGI4YzEzZmMzZWE2NTE1OTI2NWMyMWM3YmIzNTllNjA1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoYW5zZ0BrZXJuZWwub3Jn
PgpEYXRlOiBUdWUsIDkgU2VwIDIwMjUgMTE6MDk6MzcgKzAyMDAKU3ViamVjdDogW1BBVENI
IDEvMl0gcGxhdGZvcm0veDg2OiBpbnQzNDcyOiBVc2UgInByaXZhY3kiIGFzIGNvbl9pZCBm
b3IgdGhlCiBMRUQgbG9va3VwCgpEdXJpbmcgRFQtYmluZGluZyByZXZpZXcgZm9yIGV4dGVu
ZGluZyB0aGUgVjRMMiBjYW1lcmEgc2Vuc29yIHByaXZhY3kgTEVECnN1cHBvcnQgdG8gc3lz
dGVtcyB1c2luZyBkZXZpY2V0cmVlLCBpdCBoYXMgY29tZSB1cCB0aGF0IGhhdmluZyBhICIt
bGVkIgpzdWZmaXggZm9yIHRoZSBMRUQgbmFtZSAvIGNvbl9pZCBpcyB1bmRlc2lyYWJsZSBz
aW5jZSBpdCBhbHJlYWR5IGlzIGNsZWFyCnRoYXQgaXQgaXMgYSBMRUQuCgpEcm9wIHRoZSAi
LWxlZCIgc3VmZml4IGZyb20gdGhlIHByaXZhY3kgTEVEJ3MgbG9va3VwIHRhYmxlIGNvbl9p
ZC4KClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhhbnNnQGtlcm5lbC5vcmc+Ci0t
LQpOb3RlIHRoaXMgbmVlZHMgdG8gYmUgbWVyZ2VkIGluIHRoZSBzYW1lIGtlcm5lbCBjeWNs
ZSBhcyB0aGUgbWF0Y2hpbmcKIm1lZGlhOiB2NGwyLXN1YmRldjogVXNlICJwcml2YWN5IiBh
cyBjb25faWQgd2hlbiBnZXR0aW5nIHRoZSBwcml2YWN5IExFRCIKcGF0Y2guCi0tLQogZHJp
dmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvaW50MzQ3Mi9sZWQuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL2ludDM0NzIvbGVkLmMgYi9kcml2ZXJzL3BsYXRm
b3JtL3g4Ni9pbnRlbC9pbnQzNDcyL2xlZC5jCmluZGV4IGYxZDZkN2IwY2I3NS4uYjFkODRi
OTY4MTEyIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9pbnQzNDcy
L2xlZC5jCisrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL2ludDM0NzIvbGVkLmMK
QEAgLTQzLDcgKzQzLDcgQEAgaW50IHNrbF9pbnQzNDcyX3JlZ2lzdGVyX3BsZWQoc3RydWN0
IGludDM0NzJfZGlzY3JldGVfZGV2aWNlICppbnQzNDcyLCBzdHJ1Y3QgZ3AKIAogCWludDM0
NzItPnBsZWQubG9va3VwLnByb3ZpZGVyID0gaW50MzQ3Mi0+cGxlZC5uYW1lOwogCWludDM0
NzItPnBsZWQubG9va3VwLmRldl9pZCA9IGludDM0NzItPnNlbnNvcl9uYW1lOwotCWludDM0
NzItPnBsZWQubG9va3VwLmNvbl9pZCA9ICJwcml2YWN5LWxlZCI7CisJaW50MzQ3Mi0+cGxl
ZC5sb29rdXAuY29uX2lkID0gInByaXZhY3kiOwogCWxlZF9hZGRfbG9va3VwKCZpbnQzNDcy
LT5wbGVkLmxvb2t1cCk7CiAKIAlyZXR1cm4gMDsKLS0gCjIuNTEuMAoK
--------------Ks5pXm1R52GZGS5sYHOnm0Kr
Content-Type: text/x-patch; charset=UTF-8;
 name="0002-media-v4l2-subdev-Use-privacy-as-con_id-when-getting.patch"
Content-Disposition: attachment;
 filename*0="0002-media-v4l2-subdev-Use-privacy-as-con_id-when-getting.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAwMmRjZTNlZWMzNGNkOGI4OTRmYzVmZWYwMDlhNmUzMDJmNThjMmYzIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoYW5zZ0BrZXJuZWwub3Jn
PgpEYXRlOiBUdWUsIDkgU2VwIDIwMjUgMTE6MTQ6MzQgKzAyMDAKU3ViamVjdDogW1BBVENI
IDIvMl0gbWVkaWE6IHY0bDItc3ViZGV2OiBVc2UgInByaXZhY3kiIGFzIGNvbl9pZCB3aGVu
IGdldHRpbmcKIHRoZSBwcml2YWN5IExFRAoKRHVyaW5nIERULWJpbmRpbmcgcmV2aWV3IGZv
ciBleHRlbmRpbmcgdGhlIFY0TDIgY2FtZXJhIHNlbnNvciBwcml2YWN5IExFRApzdXBwb3J0
IHRvIHN5c3RlbXMgdXNpbmcgZGV2aWNldHJlZSwgaXQgaGFzIGNvbWUgdXAgdGhhdCBoYXZp
bmcgYSAiLWxlZCIKc3VmZml4IGZvciB0aGUgTEVEIG5hbWUgLyBjb25faWQgaXMgdW5kZXNp
cmFibGUgc2luY2UgaXQgYWxyZWFkeSBpcyBjbGVhcgp0aGF0IGl0IGlzIGEgTEVELgoKRHJv
cCB0aGUgIi1sZWQiIHN1ZmZpeCBmcm9tIHRoZSBjb25faWQgYXJndW1lbnQgdG8gbGVkX2dl
dCgpLgoKU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGFuc2dAa2VybmVsLm9yZz4K
LS0tCk5vdGUgdGhpcyBuZWVkcyB0byBiZSBtZXJnZWQgaW4gdGhlIHNhbWUga2VybmVsIGN5
Y2xlIGFzIHRoZSBtYXRjaGluZwoicGxhdGZvcm0veDg2OiBpbnQzNDcyOiBVc2UgInByaXZh
Y3kiIGFzIGNvbl9pZCBmb3IgdGhlIExFRCBsb29rdXAiCnBhdGNoLgotLS0KIGRyaXZlcnMv
bWVkaWEvdjRsMi1jb3JlL3Y0bDItc3ViZGV2LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL21l
ZGlhL3Y0bDItY29yZS92NGwyLXN1YmRldi5jIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUv
djRsMi1zdWJkZXYuYwppbmRleCAxMTNlYjc0ZWI3YzEuLmJhYmNjMTEyMDM1NCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1zdWJkZXYuYworKysgYi9kcml2
ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLXN1YmRldi5jCkBAIC0yNjAyLDcgKzI2MDIsNyBA
QCBFWFBPUlRfU1lNQk9MX0dQTCh2NGwyX3N1YmRldl9pc19zdHJlYW1pbmcpOwogaW50IHY0
bDJfc3ViZGV2X2dldF9wcml2YWN5X2xlZChzdHJ1Y3QgdjRsMl9zdWJkZXYgKnNkKQogewog
I2lmIElTX1JFQUNIQUJMRShDT05GSUdfTEVEU19DTEFTUykKLQlzZC0+cHJpdmFjeV9sZWQg
PSBsZWRfZ2V0KHNkLT5kZXYsICJwcml2YWN5LWxlZCIpOworCXNkLT5wcml2YWN5X2xlZCA9
IGxlZF9nZXQoc2QtPmRldiwgInByaXZhY3kiKTsKIAlpZiAoSVNfRVJSKHNkLT5wcml2YWN5
X2xlZCkgJiYgUFRSX0VSUihzZC0+cHJpdmFjeV9sZWQpICE9IC1FTk9FTlQpCiAJCXJldHVy
biBkZXZfZXJyX3Byb2JlKHNkLT5kZXYsIFBUUl9FUlIoc2QtPnByaXZhY3lfbGVkKSwKIAkJ
CQkgICAgICJnZXR0aW5nIHByaXZhY3kgTEVEXG4iKTsKLS0gCjIuNTEuMAoK

--------------Ks5pXm1R52GZGS5sYHOnm0Kr--
