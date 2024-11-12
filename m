Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3079C4AFD
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 01:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC6010E172;
	Tue, 12 Nov 2024 00:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MJgCMFXd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C131510E172
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 00:35:19 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-3a3b8b34be9so17768775ab.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 16:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1731371719; x=1731976519;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h2RamCiRbvufmYpTkLSPafjrY96FSeVA6M3qaZiwKq0=;
 b=MJgCMFXdDVWuOgHnQFoOY+rdaWZCeO44EBCQ+ZMYN6RtBG9g33EoiDVoCATKbszY0i
 saU1+sOvIEDl0eu/hEqap8plr1FoERXhwWJqDNrviotv5AZ1mUZXrqpVTI4YNRc0Ex2z
 MyBujyvpKKYKFj+Vxe5OqDvhET5NKklpX63Uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731371719; x=1731976519;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h2RamCiRbvufmYpTkLSPafjrY96FSeVA6M3qaZiwKq0=;
 b=gvqQQow/SvQukVdJCjQdaS7DwhPmppYrE2jinyQ4vFEXpl7ZUfqgMNuE859tjbRTzQ
 lejkgT0IXmx8BcshAYQXAPACOEy5zcV8tuBOBYBh9CXPe8mN9n0rarUaHxpfWGTxSKsy
 xHK4kuV13KPpBAHifHVbftrdad46IOec2fJaMAy3cVaos9NR9s6blolgAMd2QDIod7B5
 3Oeoi6IfAbDoTbsDjNmS412ppZb4FiccnCAqXPxuL29oAODwXrJ/8b5aGcpnTkCJXXog
 ZIj9il43nEd8H/LiEeR8H8C5z7OMw3B41WiVRR7EVtki0VRJVB7OyZScZPORfHE3mosZ
 Jtig==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9O2pRYD6aPUQ/1KmbMQkvyJPwaOKvm34cY4Z6zStUAMgTl/0SMIIIxZQ6Moj2iq/LPtjzBSCy4h4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNbSzTIEB48JFKb5jLJGGsZsuKZtZN/1SP8z8XnXY+UQcVJlEw
 OlwWjA8HFGDmVCIQ41ORq10tbA9Yxe7VY2D7K/pS5vzEE0WvgWMES1rL1WBAQaI=
X-Google-Smtp-Source: AGHT+IFIiVIb9rMN+B8i2xWtzWDjGjPrTfribRqLKwNimYLO6WRm7F0fCfgf+WS8c5Kw/Wf51x0d9A==
X-Received: by 2002:a05:6e02:1686:b0:3a6:aee2:1693 with SMTP id
 e9e14a558f8ab-3a6f19adc0fmr165181785ab.6.1731371718701; 
 Mon, 11 Nov 2024 16:35:18 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6f9890d2esm17379085ab.72.2024.11.11.16.35.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 16:35:18 -0800 (PST)
Message-ID: <7d14de47-119a-42e4-a911-f8accae4abf1@linuxfoundation.org>
Date: Mon, 11 Nov 2024 17:35:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/CoC: spell out enforcement for unacceptable
 behaviors
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: gregkh@linuxfoundation.org, corbet@lwn.net, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Steven Rostedt <rostedt@goodmis.org>, Dan Williams
 <dan.j.williams@intel.com>, Dave Airlie <airlied@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241108161853.12325-1-skhan@linuxfoundation.org>
 <ZzJkAJEjKidV8Fiz@phenom.ffwll.local>
 <ba3d5492-e774-452f-9fe0-e68b743c6b0d@linuxfoundation.org>
 <20241111223538.GD17916@pendragon.ideasonboard.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241111223538.GD17916@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 11/11/24 15:35, Laurent Pinchart wrote:
> Hi Shuah,
> 
> On Mon, Nov 11, 2024 at 02:50:45PM -0700, Shuah Khan wrote:
>> On 11/11/24 13:07, Simona Vetter wrote:
>>> On Fri, Nov 08, 2024 at 09:18:53AM -0700, Shuah Khan wrote:
>>>> The Code of Conduct committee's goal first and foremost is to bring about
>>>> change to ensure our community continues to foster respectful discussions.
>>>>
>>>> In the interest of transparency, the CoC enforcement policy is formalized
>>>> for unacceptable behaviors.
>>>>
>>>> Update the Code of Conduct Interpretation document with the enforcement
>>>> information.
>>>>
>>>> Acked-by: Linus Torvalds <torvalds@linux-foundation.org>
>>>> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>> Acked-by: Miguel Ojeda <ojeda@kernel.org>
>>>> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
>>>> Acked-by: Jonathan Corbet <corbet@lwn.net>
>>>> Acked-by: Steven Rostedt <rostedt@goodmis.org>
>>>> Acked-by: Dan Williams <dan.j.williams@intel.com>
>>>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>>>
>>> I think it's really good to document these details. The freedesktop coc
>>> team is going through the same process, we've also done a talk at XDC
>>> about all these changes, and I think this helps a lot in transparency and
>>> accountability in practice. With that, some thoughts below.
> 
> I've been thinking about replying to this patch for a few days now. I
> think I managed to sleep over it enough to make that possible.
> 
> I share Sima's opinion here. There is FUD around the CoC and its
> enforcement process due to lack of transparency, so I believe
> documenting the goals and means is important and will help.
> 

Thank you for your feedback.

>> Thank you Simona for your review and feedback.
>>
>>>> ---
>>>>    .../code-of-conduct-interpretation.rst        | 52 +++++++++++++++++++
>>>>    1 file changed, 52 insertions(+)
>>>>
>>>> diff --git a/Documentation/process/code-of-conduct-interpretation.rst b/Documentation/process/code-of-conduct-interpretation.rst
>>>> index 66b07f14714c..21dd1cd871d2 100644
>>>> --- a/Documentation/process/code-of-conduct-interpretation.rst
>>>> +++ b/Documentation/process/code-of-conduct-interpretation.rst
>>>> @@ -156,3 +156,55 @@ overridden decisions including complete and identifiable voting details.
>>>>    Because how we interpret and enforce the Code of Conduct will evolve over
>>>>    time, this document will be updated when necessary to reflect any
>>>>    changes.
>>>> +
>>>> +Enforcement for Unacceptable Behavior Code of Conduct Violations
>>>> +----------------------------------------------------------------
>>>> +
>>>> +The Code of Conduct committee works to ensure that our community continues
>>>> +to be inclusive and fosters diverse discussions and viewpoints, and works
>>>> +to improve those characteristics over time. The Code of Conduct committee
>>>> +takes measures to restore productive and respectful collaboration when an
>>>> +unacceptable behavior has negatively impacted that relationship.
>>>> +
>>>> +Seek public apology for the violation
>>>> +*************************************
>>>> +
>>>> +The Code of Conduct Committee publicly calls out the behavior in the
>>>> +setting in which the violation has taken place, seeking public apology
>>>> +for the violation.
>>>> +
>>>> +A public apology for the violation is the first step towards rebuilding
>>>> +the trust. Trust is essential for the continued success and health of the
>>>> +community which operates on trust and respect.
>>>
>>> Personal take, but I think a forced public apology as the primary or at
>>> least initial coc enforcement approach is one of the worst.
>>
>> Seeking public apology is in response to unacceptable behaviors which are
>> serious in nature. These incidents are exceedingly rare. When these incidents
>> happen, they usually resolve when another developer/community member points
>> out the behavior. The individual responds with a voluntary apology to
>> mend fences and repair harm.
>>
>> The CoC  gets involved only when it receives a report which is the case
>> when normal paths such as peers pointing out the behavior to repair the
>> harm haven't been successful.
>>
>> This document isn't intended to be a complete summary of all actions the
>> CoC takes in response to reports. There is a lot of back and forth with
>> the individuals to bring about change before the CoC asks for an apology.
>>

See below clarification on above use of "actions"

>> The CoC seeks public apology only when it is essential to repair the harm.
> 
> Limiting the CoC committee to seeking public apology, due to what it
> means in terms of both process and goal, would deprive the committee
> from many useful courses of action. I was expecting you were not limited
> to this, and I appreciate that you are stating it clearly here. It is
> not however clear from this patch, and I believe it would benefit the
> whole community if this was explained better in the document. A more
> detailed description of the different means of action and outcomes would
> help balance the fact that the proceedings of the CoC committe are not
> public.
The actions CoC takes prior asking for a public apology are working
with the individual to bring about change in their understanding the
importance to repair damage caused by the behavior.

Since these are measures to bring about change, the document doesn't
go into the details about the logistics.

If you have other possible courses of action in mind, please do state
them.
  
> 
> I would like to add that I appreciate the emphasis on rebuilding trust
> as a goal, as I also believe trust and respect are essential. This
> includes trust that victims will receive the support and protection they
> need, trust that authors of behaviour deemed unfit by the community will
> be treated fairly, and trust that the community will continuously work
> on improving inclusiveness. All three aspects are needed to avoid
> driving current and prospective community members away.
> 
>>> First, a ban or temporary suspension seems too mechanical and not in
>>> proportion with the offence of failing to apologize. In my enforcement
>>> thus far as maintainer and now also freedesktop.org CoC member we only use
>>> punishment if behavior has failed to change _and_ we need to protect the
>>> community from further harm. Usually it takes years to get to that point,
>>> unless in extremely severe cases (like public harrassment campaigns) or
>>> when the person stated that they refuse to even consider changing behavior
>>> at all.
>>
>> Please see above. Public apology is necessary to repair and restore the
>> health of the community in these rare cases when an individual doesn't
>> understand that their behavior could cause harm. The CoC tries to get
>> the individual to realize that offering a public apology is necessary
>> to repair the harm and resume respectful and productive discussions.
>>
>>> Public means you're amping up the stakes and massively increase the odds
>>> of people being afraid of their reputation and losing face. In my
>>> experience people are a lot more reasonable when you discuss their
>>> behavior and what needs to change in private. This even includes the case
>>> where a temporary suspension had to be put in place already first, to
>>> protect others.
>>
>> Please see above. The CoC works with the individual prior to taking the step
>> of asking for an apology. It is a balancing act between repairing
>> the harm caused to the individuals at the receiving end of the public
>> unacceptable behavior and working with the individual to understand the
>> harm done by such a behavior.
>>
>> The CoC is mindful of the negative impact of seeking public apology and
>> instituting ban could have on individuals.
> 
> It could also be worth adding that, as Sima pointed out below, public
> apology is sometimes not the best option for the victim.

The CoC takes these into consideration during the investigation,
before determining the best course of action.

Some people may
> be afraid to report bad behaviours if they thought that the story would
> be made public by a requirement to apologize publicly. I have total
> confidence that the CoC committee will consult with the victim to
> determine the best course of action, and that is worth documenting
> explicitly.
> 

Thank you for your confidence in the CoC.

Please note that the CoC has the obligation to keep the reports
and individual information private. This public apology is specific
to a public violation that has taken place on a public email list.
The information and details are already public.

The CoC could receive reports from a community member who could be
an observer and not the victim. The CoC has the responsibility to
investigate all such public violations.

The CoC has the obligation to keep the reports privates. The public
part is where the individual who violated the agreed upon Code of
Conduct is asked to apologize to in response to the thread in which
the violation has taken place.

thanks,
-- Shuah




