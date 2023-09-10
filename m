Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FB9799F6B
	for <lists+dri-devel@lfdr.de>; Sun, 10 Sep 2023 21:11:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E140910E089;
	Sun, 10 Sep 2023 19:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C426610E089
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 19:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=XZRevTL+j5CTC/U9fMUSZwKRO+yPfHe6aXCanifBJjk=; b=UwALS+6ToEC/PwpYZB0g+z3wS4
 9lmEpsd4+LCMrAYCAwWjh1o1P2c9FXx/VPYVT1ZAyTQBir1nSnZP6c3gbATgtmjwDwV+bEkUQpCBp
 AWkGRZUpHrAUQOIjhpUGd0Fb81y5tE2j1Pz9b++tFMEfRSJWkq11GbMCLzilLKRJ9SAXnsrTDB8NJ
 W9QI4/4jyYHS8jQROYj3ly6N9zeWpvUR2yiw0OsEGOHQyLCqukilV73y3mgUxLIsyGvnYv3p4socA
 shlhvz54oMF3n8Q5sqxc2wFEkXDwkvgBi1GEEC17gI52gDcJHnILp2ZaNOIFFO29LH6Vyd95jJiLP
 QIknMBNA==;
Received: from [2601:1c2:980:9ec0::9fed]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qfPqL-00GqQ6-28; Sun, 10 Sep 2023 19:11:37 +0000
Message-ID: <7f269b1b-0f82-3dcf-9b06-e4ebf26990d9@infradead.org>
Date: Sun, 10 Sep 2023 12:11:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] drm: fix doc warnings related to drm connector
Content-Language: en-US
To: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
References: <20230909110343.8103-1-bragathemanick0908@gmail.com>
 <ZP0-DaW3lIeaZ8xY@debian.me>
 <3ae5be2b-8075-5a4d-65c7-7282a44909f3@infradead.org>
 <CAHZF+VZLB5h0HY2voHaMmkWsd_okTSP2svgNetNPJWG0MX9Gew@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAHZF+VZLB5h0HY2voHaMmkWsd_okTSP2svgNetNPJWG0MX9Gew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, Bagas Sanjaya <bagasdotme@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/9/23 23:37, Bragatheswaran Manickavel wrote:
>>On Sun, 10 Sept 2023 at 09:29, Randy Dunlap <rdunlap@infradead.org <mailto:rdunlap@infradead.org>> wrote:
>>On 9/9/23 20:54, Bagas Sanjaya wrote:
>>> On Sat, Sep 09, 2023 at 04:33:43PM +0530, Bragatheswaran Manickavel wrote:
>>>> Addressing drm dp/hdmi connector related kernel documentation
>>>> warning and add more information about these values.
>>>
>>> What are these?
>>>
>>
>>There are already patches for these issues.
>>
>>Please check latest linux-next and make patches to it instead of using mainline.
>>
>>Thanks.
> 
> Just had a look at the latest next-20230908. Changes of include/drm/drm_connector.h are
> not present.

That's correct. The patch for that was sent on Sept. 6 and applied to a drm git tree
on Sept. 7.

It's here:  https://lore.kernel.org/all/20230906-topic-drm_connector_doc-v2-1-1f2dcaa43269@gmail.com/


>>>>
>>>> Signed-off-by: Bragatheswaran Manickavel <bragathemanick0908@gmail.com <mailto:bragathemanick0908@gmail.com>>
>>>> ---
>>>>  drivers/gpu/drm/drm_connector.c | 2 ++
>>>>  include/drm/drm_connector.h     | 2 ++
>>>>  2 files changed, 4 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>>>> index bf8371dc2a61..084c95785dda 100644
>>>> --- a/drivers/gpu/drm/drm_connector.c
>>>> +++ b/drivers/gpu/drm/drm_connector.c
>>>> @@ -2203,6 +2203,7 @@ static int drm_mode_create_colorspace_property(struct drm_connector *connector,
>>>>  /**
>>>>   * drm_mode_create_hdmi_colorspace_property - create hdmi colorspace property
>>>>   * @connector: connector to create the Colorspace property on.
>>>> + * @supported_colorspaces: to get hdmi supported colorspaces.
>>>>   *
>>>>   * Called by a driver the first time it's needed, must be attached to desired
>>>>   * HDMI connectors.
>>>> @@ -2227,6 +2228,7 @@ EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
>>>>  /**
>>>>   * drm_mode_create_dp_colorspace_property - create dp colorspace property
>>>>   * @connector: connector to create the Colorspace property on.
>>>> + * @supported_colorspaces: to get dp supported colorspaces.
>>>>   *
>>>>   * Called by a driver the first time it's needed, must be attached to desired
>>>>   * DP connectors.
>>>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>>>> index d300fde6c1a4..556d66dd122c 100644
>>>> --- a/include/drm/drm_connector.h
>>>> +++ b/include/drm/drm_connector.h
>>>> @@ -498,6 +498,8 @@ enum drm_privacy_screen_status {
>>>>   *   ITU-R BT.601 colorimetry format
>>>>   *   The DP spec does not say whether this is the 525 or the 625
>>>>   *   line version.
>>>> + * @DRM_MODE_COLORIMETRY_COUNT:
>>>> + *   Represents the count of colorspaces.
>>>>   */
>>>>  enum drm_colorspace {
>>>>      /* For Default case, driver will set the colorspace */
>>>
>>> Oh, you mean to add description for colorspace-related fields.
>>>
>>> Thanks.
>>>
>>>
>>
>>--
> ~Randy

-- 
~Randy
