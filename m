Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CA968A886
	for <lists+dri-devel@lfdr.de>; Sat,  4 Feb 2023 07:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BF510E0BA;
	Sat,  4 Feb 2023 06:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9294A10E060
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Feb 2023 06:09:48 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so7405156wmb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 22:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=froggi.es; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W66RnPr8JIOCxTmk17xRzi5pC7iGA+sDw7TDAFUhQto=;
 b=CD+0hzlMTdkEJ4vCmE4FnN3eYKFC1HKqGQPSEHT74IDFqwmJP7MhBh7EkzEiNmNXnW
 NArTzdf1BUSSiZWkY3TOH5Vp2TE6edBi+razrWrVpgrYAHNIYJPR8o5qlyKd7t9kzEFL
 rcAh4ii+juRDk5+fxJo3dsYvCjayNyVIgMzx4TsfIMxMGBIHDXJMTDvfoA0QVSIkim/w
 o+esAx8K98YtnnDuaofOT6BVRXsvVVDtltkG5bQPqCJef59NFoxPnUQOvg/8t+g/HiyT
 0gMIKA2ASe9KpI+RALTDRTQ1YSKSLzTFdTAixlfTJo9VGHBKeqQPKGiuGcn9ur2tWkSd
 nWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W66RnPr8JIOCxTmk17xRzi5pC7iGA+sDw7TDAFUhQto=;
 b=AK7wSXnUZUswwGqCbpOx/vxpmWj6YnpfBYRXb50Iq2t/nmSi/SNwSxOc3RDT5oprGg
 3lc5cqFvmelDyz2RTviCVVBb1LUFT0x1fNFLCQEVZXBbEuK8pvO2orI8RZg/ZtHZUuWN
 jCtDYA4UOZcQbmCyQQszJQCKtUJMhEZzKU0nnz4gNKIJXrMm2bJEk9JshVPzPOMmmZ+J
 Nh01BznjtHd0hxHLuY4f0Cpa1Q6PrQy1EJnPGD3i/00ZoX2HIKqi86A1ccj0ktdx1x12
 8Y+X/5OraWRTTL7QOMVBLxVg2PMigevFHBxC9eZlSwcwks7AhgoQCY8NtJNYSN/OLuDk
 /ZTg==
X-Gm-Message-State: AO0yUKWH0brSjRDDHG/TLXc2D5vO1OdJ8uhtK6x8AfaN3aLJRkEfg+Xl
 BiRU/hcn1nswCxUMvJSX/1GZcg==
X-Google-Smtp-Source: AK7set8d0J7JTyt8kwfZddTmA5h+tz3k3sUqFes4exIhg1x675pADS8q0NFIXv3i+UB0bC2NEiVNoQ==
X-Received: by 2002:a05:600c:3b9d:b0:3df:de27:4191 with SMTP id
 n29-20020a05600c3b9d00b003dfde274191mr8011323wms.16.1675490986935; 
 Fri, 03 Feb 2023 22:09:46 -0800 (PST)
Received: from [192.168.0.89]
 (darl-09-b2-v4wan-165404-cust288.vm5.cable.virginm.net. [86.17.61.33])
 by smtp.gmail.com with ESMTPSA id
 n29-20020a05600c181d00b003db06224953sm4367323wmp.41.2023.02.03.22.09.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 22:09:46 -0800 (PST)
Message-ID: <a3d46b3a-ebd5-e02c-3db4-783f2a34b36c@froggi.es>
Date: Sat, 4 Feb 2023 06:09:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Harry Wentland <harry.wentland@amd.com>
References: <20230203020744.30745-3-joshua@froggi.es>
 <Y9zkef5FjtZ7guVS@intel.com>
 <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
 <0fc18aec-0703-55f4-f635-d09d345e8dc0@amd.com> <Y90l+DY0rSaMvN1U@intel.com>
 <758e5cf6-53e0-567c-c760-5b773bc7a11c@amd.com> <Y90vrEa3/1RbaGOV@intel.com>
 <f9633729-2db0-3bf1-311d-f03bd04d47a6@amd.com> <Y91Y98jyOimabC3O@intel.com>
 <Y91fsmgAx65koWI5@intel.com> <Y91hyNAplv4nuW5Y@intel.com>
Content-Language: en-US
From: Joshua Ashton <joshua@froggi.es>
In-Reply-To: <Y91hyNAplv4nuW5Y@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 dri-devel@lists.freedesktop.org, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/3/23 19:34, Ville Syrjälä wrote:
> On Fri, Feb 03, 2023 at 09:25:38PM +0200, Ville Syrjälä wrote:
>> On Fri, Feb 03, 2023 at 08:56:55PM +0200, Ville Syrjälä wrote:
>>> On Fri, Feb 03, 2023 at 01:28:20PM -0500, Harry Wentland wrote:
>>>>
>>>>
>>>> On 2/3/23 11:00, Ville Syrjälä wrote:
>>>>> On Fri, Feb 03, 2023 at 10:24:52AM -0500, Harry Wentland wrote:
>>>>>>
>>>>>>
>>>>>> On 2/3/23 10:19, Ville Syrjälä wrote:
>>>>>>> On Fri, Feb 03, 2023 at 09:39:42AM -0500, Harry Wentland wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 2/3/23 07:59, Sebastian Wick wrote:
>>>>>>>>> On Fri, Feb 3, 2023 at 11:40 AM Ville Syrjälä
>>>>>>>>> <ville.syrjala@linux.intel.com> wrote:
>>>>>>>>>>
>>>>>>>>>> On Fri, Feb 03, 2023 at 02:07:44AM +0000, Joshua Ashton wrote:
>>>>>>>>>>> Userspace has no way of controlling or knowing the pixel encoding
>>>>>>>>>>> currently, so there is no way for it to ever get the right values here.
>>>>>>>>>>
>>>>>>>>>> That applies to a lot of the other values as well (they are
>>>>>>>>>> explicitly RGB or YCC). The idea was that this property sets the
>>>>>>>>>> infoframe/MSA/SDP value exactly, and other properties should be
>>>>>>>>>> added to for use userspace to control the pixel encoding/colorspace
>>>>>>>>>> conversion(if desired, or userspace just makes sure to
>>>>>>>>>> directly feed in correct kind of data).
>>>>>>>>>
>>>>>>>>> I'm all for getting userspace control over pixel encoding but even
>>>>>>>>> then the kernel always knows which pixel encoding is selected and
>>>>>>>>> which InfoFrame has to be sent. Is there a reason why userspace would
>>>>>>>>> want to control the variant explicitly to the wrong value?
>>>>>>>>>
>>>>>>>>
>>>>>>>> I've asked this before but haven't seen an answer: Is there an existing
>>>>>>>> upstream userspace project that makes use of this property (other than
>>>>>>>> what Joshua is working on in gamescope right now)? That would help us
>>>>>>>> understand the intent better.
>>>>>>>
>>>>>>> The intent was to control the infoframe colorimetry bits,
>>>>>>> nothing more. No idea what real userspace there was, if any.

Controlling the infoframe alone isn't useful at all unless you can 
guarantee the wire encoding, which we cannot do.

>>>>>>>
>>>>>>>>
>>>>>>>> I don't think giving userspace explicit control over the exact infoframe
>>>>>>>> values is the right thing to do.

+1

>>>>>>>
>>>>>>> Only userspace knows what kind of data it's stuffing into
>>>>>>> the pixels (and/or how it configures the csc units/etc.) to
>>>>>>> generate them.
>>>>>>>
>>>>>>
>>>>>> Yes, but userspace doesn't control or know whether we drive
>>>>>> RGB or YCbCr on the wire. In fact, in some cases our driver
>>>>>> needs to fallback to YCbCr420 for bandwidth reasons. There
>>>>>> is currently no way for userspace to know that and I don't
>>>>>> think it makes sense.
>>>>>
>>>>> People want that control as well for whatever reason. We've
>>>>> been asked to allow YCbCr 4:4:4 output many times.
>>>>>
>>>>> The automagic 4:2:0 fallback I think is rather fundementally
>>>>> incompatible with fancy color management. How would we even
>>>>> know whether to use eg. BT.2020 vs. BT.709 matrix? In i915
>>>>> that stuff is just always BT.709 limited range, no questions
>>>>> asked.

That's what the Colorspace property *should* be determining here.
That's what we have it set up to do in SteamOS/my tree right now.

>>>>>
>>>>
>>>> We use what we're telling the display, i.e., the value in the
>>>> colorspace property. That way we know whether to use a BT.2020
>>>> or BT.709 matrix.
>>>
>>> And given how these things have gone in the past I think
>>> that is likey to bite someone at in the future. Also not
>>> what this property was meant to do nor does on any other
>>> driver AFAIK.
>>>
>>>> I don't see how it's fundamentally incompatible with fancy
>>>> color management stuff.
>>>>
>>>> If we start forbidding drivers from falling back to YCbCr
>>>> (whether 4:4:4 or 4:2:0) we will break existing behavior on
>>>> amdgpu and will see bug reports.
>>>
>>> The compositors could deal with that if/when they start doing
>>> the full color management stuff. The current stuff only really
>>> works when the kernel is allowed to do whatever it wants.
>>>
>>>>
>>>>> So I think if userspace wants real color management it's
>>>>> going to have to set up the whole pipeline. And for that
>>>>> we need at least one new property to control the RGB->YCbCr
>>>>> conversion (or to explicitly avoid it).

I mentioned this in my commit description, we absolutely should offer 
fine control here eventually.

I don't think we need to solve that problem here though.

>>>>>
>>>>> And given that the proposed patch just swept all the
>>>>> non-BT.2020 issues under the rug makes me think no
>>>>> one has actually come up with any kind of consistent
>>>>> plan for anything else really.
>>>>>
>>>>
>>>> Does anyone actually use the non-BT.2020 colorspace stuff?
>>>
>>> No idea if anyone is using any of it. It's a bit hard to do
>>> right now outside the full passthrough case since we have no
>>> properties to control how the hardware will convert stuff.

No, every userspace knows that encoding of the output buffer before 
going to the wire format is RGB.

It's the only way you can have planes alpha-blend, or mix and match RGB 
and NV12, etc.

>>>
>>> Anyways, sounds like what you're basically proposing is
>>> getting rid of this property and starting from scratch.
>>
>> Hmm. I guess one option would be to add that property to
>> control the output encoding, but include a few extra
>> "automagic" values to it which would retain the kernel's
>> freedom to select whether to do the RGB->YCbCr conversion
>> or not.
>>
>> enum output_encoding {
>> 	auto rgb=default/nodata,ycbcr=bt601
>> 	auto rgb=default/nodata,ycbcr=bt709
>> 	auto rgb=bt2020,ycbcr=bt2020
>> 	passthrough,
>> 	rgb->ycbcr bt601,
>> 	rgb->ycbcr bt709,
>> 	rgb->ycbcr bt2020,
>> }
> 
> In fact there should perhaps be a lot more of the explicit
> options to get all subsamlings and quantizations ranges
> coverted. That might actually be really nice for an igt
> to get more full test coverage.
> 
The choice of encoding of the pixel on the wire should be unrelated to 
the overall output colorspace from the userspace side -- but how the 
display engine converts the output to that wire format *is* dependent on 
the colorspace.
eg. picking a rec.709 ctc vs a rec.2020 ctc matrix.

I see you are proposing a "passthrough" but that wouldn't work at all as 
you still need to at know if you are RGB or YCbCr for the infoframe and 
to perform chroma subsampling in the display engine.

I perused the initial patches that added this property, and it seems 
there were no IGT tests or userspace implementation, so I am not 
entirely sure why it was committed in the first place.

Nobody can safely use Colorspace because of this problem right now.

If nobody is using this property, perhaps we could just get a fresh 
start, and either re-purpose it with new enum values, or obsolete it and 
make a new property.
If we do this, let's start with the absolute bare minimum, such as:
"Default/Rec.709 (sRGB), BT.2020"
and then grow as we need, making sure we have the full circle from 
userspace->output complete and working for each new value we add.

Please don't take this as me saying we shouldn't add all these other 
options like opRGB, etc, I just want us to progress to a solid base for 
expanding further here, which we really don't have right now.

- Joshie 🐸✨
