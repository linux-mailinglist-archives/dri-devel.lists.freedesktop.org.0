Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D32B212DF9F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jan 2020 18:04:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1507889C48;
	Wed,  1 Jan 2020 17:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF0289C48
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jan 2020 17:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577898251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s50ZsxwjIKokV6x0z0goKHHGd0zXqfM+O8mAjhUFi1c=;
 b=UZ9PonFi/oiAXS5mhilxCudpV5vlqknEneyndSzZqq+Ks0zz4tjHjwtU9VMvh+t03YcS/x
 AsxcwQPm1awupula1bccvFuktH/URDPLwOcecWfLK6uEuhitbCiiFZTSQuq1MNHUqkkaL8
 BUSrd2uZbPcYHeGthmU8K0Y+RsRCx+Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-E723Tf3pNzSDymIFhQuaLQ-1; Wed, 01 Jan 2020 12:04:10 -0500
Received: by mail-wr1-f69.google.com with SMTP id f15so6231569wrr.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jan 2020 09:04:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s50ZsxwjIKokV6x0z0goKHHGd0zXqfM+O8mAjhUFi1c=;
 b=UeYuZe4GsN2klYBAq6W2PSX2G714dUBQMUmuLNdIuoAHcz5yxNVDT/ndn4XEIh4an4
 VJ/LYR4QCcdTtETbQSxDjVRocbBf72yFix5k5oK2GIGfHVwvLU3a19xYg5rbCSEcxZGi
 UXayiCPgJ4nERhsJS5w0/Yi5p5NuHXFfIF4Rw6gY8Xl/Z+QG+dTppMDyGUCjaRhTPKh2
 aatyVld7uMq7wiYxaXP8nTpny7xGJOq3Wps797bZmpjuj3kaqGKAAUe3+wfrn95gxezF
 2b/xYAdmWs4eNxdFZTCr+YgzF3e0n7S2F34iQ9u7nZ1lVWEaP5K19ADIuR18aPXtQ+UK
 2+lQ==
X-Gm-Message-State: APjAAAWJMtNDp/0ZQoQEp9tyKv7RZUDi5+XOnkG6RW96Cjd0LT36ikJB
 EJp1P3BPXwyB8yJhOCMawStab3qFu3ktHevVxqDYZgZ/a4dCPvucDE86pzPA36Uc1rM59Mld3HL
 /QrjXSMyPqAXhHO9lD9wsSu6RXNQG
X-Received: by 2002:a1c:7c18:: with SMTP id x24mr10312560wmc.21.1577898249274; 
 Wed, 01 Jan 2020 09:04:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqzZTswoExdSMw9TTuCmWANB6Q+psIllWhIgAWnlMFTOxuGzjGUdFyH9riu/K/XUlyuqb2WIVw==
X-Received: by 2002:a1c:7c18:: with SMTP id x24mr10312542wmc.21.1577898249095; 
 Wed, 01 Jan 2020 09:04:09 -0800 (PST)
Received: from shalem.localdomain
 (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
 by smtp.gmail.com with ESMTPSA id x16sm5961353wmk.35.2020.01.01.09.04.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jan 2020 09:04:08 -0800 (PST)
Subject: Re: [PATCH resend 0/2] drm/connector: Add support for specifying
 panel_orientation on the kernel cmdline
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20191216115158.862404-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <0d0e898f-a853-de16-40bf-4b7e3785b567@redhat.com>
Date: Wed, 1 Jan 2020 18:04:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191216115158.862404-1-hdegoede@redhat.com>
Content-Language: en-US
X-MC-Unique: E723Tf3pNzSDymIFhQuaLQ-1
X-Mimecast-Spam-Score: 0
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Ping? it would be really nice if we can get these last 2 patches from
my series for specifying panel_orientation on the kernel cmdline upstream.

If someone can review the first patch (the second one has already
been reviewed) then that would be great.

Thanks & Regards,

Hans



On 16-12-2019 12:51, Hans de Goede wrote:
> Hi All,
> 
> This is a resend of the last 2 remaining patches of my series for adding
> support for specifying panel_orientation on the kernel cmdline.
> 
> I've already pushed the other 11 patches which were mostly cleanups /
> bug-fixes to the cmdline-parsing code and where all acked by Maxime
> to drm-misc-next.
> 
> The first patch of these 2 still needs to be reviewed, if someone can
> review it that would be great.
> 
> Once this is reviewed the question becomes how to merge this, both
> patches are mostly drm-misc material and the second patch depends on
> the changes I just pushed to drm-misc-next, so this series should
> probably be pushed to drm-misc-next, but it also makes some changes
> to i915 code. I've checked and there is no conflict with these patches
> as they apply to drm-misc-next vs drm-intel-next-queued (atm). So it
> should be fine to push these 2 patches to drm-misc-next and then do a
> back-merge to drm-intel-next-queued.
> 
> Regards,
> 
> Hans
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
