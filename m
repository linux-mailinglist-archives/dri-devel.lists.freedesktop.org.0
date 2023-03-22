Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 510486C4863
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 11:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6161B10E914;
	Wed, 22 Mar 2023 10:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10B310E913
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 10:59:37 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id t11so22821083lfr.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 03:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679482776;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I9BZjSey1yXLeocjbsqhzGudA4US9Y+Kj5EuK+kqw+I=;
 b=iroviQ2qk+WB3LQFiLTgKmubA8HEs+mHubO46x3Ly8/I+Bs6Rz4q3z+Lgq8w75uqKP
 Trgd9UYL936dj6m0iAOw/e/9bv0RSYmMb9Ay7UPE+1gKYGZGZI5E4bQvZU00Vpb6nL9n
 DcUCXcs1MFFO59G6/1oNLsHZhUd5HmngKuspimY2VsqEOJlh8GYmWskQbIARBLKI/paj
 w+tzVq0/4XXswBgPDUBgLFYf++RJEwJA9+33RdZHbAV7VyxfA024QFI00asWH1iAym7p
 qxG1Q9J3mGXL4Xo6giJn1+M6OeILbG7/KUwnx5K16pq+/tJ0nUeM3WyYmIdwKdcGq2Xd
 l9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679482776;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I9BZjSey1yXLeocjbsqhzGudA4US9Y+Kj5EuK+kqw+I=;
 b=WeBQ0P95kRMaNPGVDgVO2MqyB4z+4kX3/LQ9sgzcEu1TKUiIgdDF40g7Yy6q1H9BSl
 tT4oSjTTh+MhOtO7gXJgBoKB02ZLs9zkiiTLXyKuQbOPvNy2gnDivFmR0IxN+E7+Eo1P
 rLliJ5jWcnytA/TZrjYgsiNVIh8nYWUL5PWW7GM+o/yjkHIklq4NRlbz+xg7JvNy0t3H
 rae2vUERUh951aVv6TjgIFHS7OK7eFXf17a+nxclXgqy1++jxeQhEdKfYOSwfIR7dTOL
 xYnrcTUZofwTwpqOKSwCmKTL6x4ENBGIEFWbJVIVQFj9h0kse4yMuVHVnHyme7JZMosG
 pDrA==
X-Gm-Message-State: AO0yUKUyTj0n4DCAYkTCAMzDsg6YyEtR1LOnq0dnRcBPY+AgczYSWOgc
 fwEIWq98K4K29Cr6X9KNLgg=
X-Google-Smtp-Source: AK7set/TVDkgVYUfGLBTwIqfYMKesouuhxGnBDrXdWDSgQyhH7KWgvGgrqxxah6QLvJqbnMmj3pA7g==
X-Received: by 2002:ac2:4c92:0:b0:4e9:d158:d56b with SMTP id
 d18-20020ac24c92000000b004e9d158d56bmr1940622lfl.62.1679482775745; 
 Wed, 22 Mar 2023 03:59:35 -0700 (PDT)
Received: from ?IPV6:2001:14ba:16f3:4a00::1?
 (dc75zzyyyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::1])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a19ad41000000b004d023090504sm2543760lfd.84.2023.03.22.03.59.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 03:59:35 -0700 (PDT)
Message-ID: <8fe9fea1-b7b8-ee46-9534-de7e2b1726f9@gmail.com>
Date: Wed, 22 Mar 2023 12:59:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US, en-GB
To: Javier Martinez Canillas <javierm@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <cover.1679474247.git.mazziesaccount@gmail.com>
 <ZBrSCYp+QrHK47dS@smile.fi.intel.com>
 <87edphnkg1.fsf@minerva.mail-host-address-is-not-set>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH v5 0/8] Support ROHM BU27034 ALS sensor
In-Reply-To: <87edphnkg1.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 linux-kselftest@vger.kernel.org, Emma Anholt <emma@anholt.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Zhigang Shi <Zhigang.Shi@liteon.com>, Masahiro Yamada <masahiroy@kernel.org>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, devicetree@vger.kernel.org,
 Paul Gazzillo <paul@pgazz.com>, Liam Beguin <liambeguin@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 David Gow <davidgow@google.com>, kunit-dev@googlegroups.com,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/22/23 12:34, Javier Martinez Canillas wrote:
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
> 
> Hello Andy,
> 
>> On Wed, Mar 22, 2023 at 11:05:23AM +0200, Matti Vaittinen wrote:
>>
>>> Revision history:
>>> v4 => v5: Mostly fixes to review comments from Andy and Jonathan.
>>> - more accurate change-log in individual patches
>>
>>> - copy code from DRM test helper instead of moving it to simplify
>>>    merging
>>
>> 1) Why do you think this is a problem?
>> 2) How would we avoid spreading more copies of the same code in the future?
>>
>>
>> 1) Merge conflicts is not a bad thing. It shows that people tested their code
>> in isolation and stabilized it before submitting to the upper maintainer.
>>
>> https://yarchive.net/comp/linux/git_merges_from_upstream.html
>>
>> 2) Spreading the same code when we _know_ this, should be very well justified.
>> Merge conflict is an administrative point, and not a technical obstacle to
>> avoid.

I definitely agree. This is also why I did the renaming and not copying 
in the first version. In this version I did still add the subsequent 
patch 2/8 - which drops the duplicates from DRM tree.

> I believe this was suggested by Maxime and the rationale is that by just
> copying the helpers for now, that would make it easier to land instead of
> requiring coordination between different subystems.

This is correct.

> Otherwise the IIO tree will need to provide an inmutable branch for the
> DRM tree to merge and so on.

Or, if we carry the patch 1/8 via self-test tree, then we get even more 
players here.

Still, I am not opposing immutable branch because that would allow fast 
applying of the patch 2/8 as well. Longer that is delayed, more likely 
we will see more users of the DRM helpers and harder it gets to remove 
the duplicates later.

> I agree with Maxime that a little bit of duplication (that can be cleaned
> up by each subsystem at their own pace) is the path of least resistance.

I'd say this depends. It probably is the path of least resistance for 
people maintaining the trees. It can also be the path of least 
resistance in general - but it depends on if there will be no new users 
for those DRM helpers while waiting the new APIs being merged in DRM 
tree. More users we see in DRM, more effort the clean-up requires.

I have no strong opinion on this specific case. I'd just be happy to see 
the IIO tests getting in preferably sooner than later - although 'soon' 
and 'late' does also depend on other factors besides these helpers...

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

