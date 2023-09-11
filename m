Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C6C79A984
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 17:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1EA810E051;
	Mon, 11 Sep 2023 15:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 939B510E051
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 15:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=MeQY0pI6Zdhk2aGEY5C7WS4yXEnfwTtX1HkrUhW3Hg0=; b=XbE3TYgW+q3blziN3ZcPDUnJRd
 nbEAZVj0pfUkdV4I3Yf6kvA9JDQvvSP9jDtNAegWVJe/dWQESfYn3bO94ny2na0usCfgqvSMwVRWA
 RzaAQKpGP27xwmG2D0GQWejHDqjygn16Zd3ic9BNAznKEjqDXpO91FdTEHNe8iX4vQJJmSjXDoKbZ
 11d2jBsm9akr6xvVkBasApmU4Cir5WpgusgedNHEioSD8VY+EQ2+1Krq3AU8WRdWRKzLG4q9ziKmu
 buAeB1wzSkd4tzTyIfIhClj7TYzGdJuHZ23sABndE4vNQl6LtjYlcC1vrSWZSdXzmh/1jMEI19R5i
 /57sASgg==;
Received: from [2601:1c2:980:9ec0::9fed]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qfien-000rEs-0s; Mon, 11 Sep 2023 15:16:57 +0000
Message-ID: <e8114d08-724d-d3f8-96a8-9872bf947f3c@infradead.org>
Date: Mon, 11 Sep 2023 08:16:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: (subset) [PATCH v2] drm/connector: document
 DRM_MODE_COLORIMETRY_COUNT
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
References: <20230906-topic-drm_connector_doc-v2-1-1f2dcaa43269@gmail.com>
 <169409716450.2201230.1132363284756871897.b4-ty@kernel.org>
 <87il8hf1p5.fsf@intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87il8hf1p5.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/11/23 03:23, Jani Nikula wrote:
> On Thu, 07 Sep 2023, Maxime Ripard <mripard@kernel.org> wrote:
>> On Wed, 06 Sep 2023 22:47:38 +0200, Javier Carrasco wrote:
>>> The drm_colorspace enum member DRM_MODE_COLORIMETRY_COUNT has been
>>> properly documented by moving the description out of the enum to the
>>> member description list to get rid of an additional warning and improve
>>> documentation clarity.
>>>
>>>
>>
>> Applied to drm/drm-misc (drm-misc-next).
> 
> After the fact, but adding /* private: */ would've been an alternative
> approach. I think support for that for enums should be there.

Yes, that was the first patch that I sent....
but nobody picked it up.

> 
> Anyway, just for future reference, the merged patch is fine.
> 
> BR,
> Jani.
> 
>>
>> Thanks!
>> Maxime


-- 
~Randy
