Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECD249BF2E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 23:55:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA05710E4A6;
	Tue, 25 Jan 2022 22:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5B310E3B3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 22:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643151342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l5eZe6k04P6h4FujwlF9i3vzXzuFnGBmcS8dEFuDl4U=;
 b=VPnypOAJJUOPIJC8aM9+qsXF2+j3plF5SHyN+X/DoB5Fefsq37OAAlTeRBHlKNtLPoR3ip
 fYgE4438PvEShcNUa9ZGW07VaoAXmzvrPKM84PphfCZw+frfRSKnWm5icEGZa1WAR15hvj
 XbQQtoEuP6aWRLdX0JdCxxxPk04b8Ic=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-AIPVlDGGOKaliFpRo0w9Qg-1; Tue, 25 Jan 2022 17:55:38 -0500
X-MC-Unique: AIPVlDGGOKaliFpRo0w9Qg-1
Received: by mail-wm1-f72.google.com with SMTP id
 o194-20020a1ca5cb000000b00350b177fb22so889553wme.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 14:55:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=l5eZe6k04P6h4FujwlF9i3vzXzuFnGBmcS8dEFuDl4U=;
 b=nVk91FwKPnNHiV9xvXK//oho8elTUhlLRleP5PeNnydV0nzDR6vSUShl32sd9W4sio
 RFIbKd/Nezt+qwlAHAnPqq7Xu7iElynrGiEbUQchbmMZJzDlB08yBYeFXkUA79JNdJZz
 ICnHqjR8em70arZ934F4DBBxrK3IoDIg9QmLfdTeM7pYvWww/x0XB0onm1qC3I0cL3at
 JuIKtSgcezUofDaWRcIipK5Aw14geRr6OuzXpqbAb4iJ5128b2Q1BSbBQllOyKYxdvwp
 p0Y6Md5lDYvkEZ5i2A9y/lwzka48RF3S8aATqyvZLA6qe8FvvqlJiaHTWyopz4AqaQm6
 mMmA==
X-Gm-Message-State: AOAM533Vvc2B1RthzkgL7+Y9gyBcH6RHUUw/5GUf1v1KMariwZ9MVd8v
 1fhmvqRYiW1QF+tf9tVloLxelyk79WSZ0eXXOZunbOP0ZY798BQg5MBW6A+BLch+UhTjsNNZveU
 7g1nU+sxtJI2+ZInBameu/lZjKxdU
X-Received: by 2002:a5d:6481:: with SMTP id o1mr5212532wri.634.1643151337092; 
 Tue, 25 Jan 2022 14:55:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwM72FiqwBIeZCWiqaero+rda/N1iBvU/aDG+fYvb/Jh1rErqIrF4zFPCKpU1dPpMpFNDQO+g==
X-Received: by 2002:a5d:6481:: with SMTP id o1mr5212524wri.634.1643151336908; 
 Tue, 25 Jan 2022 14:55:36 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id h11sm1513031wmb.12.2022.01.25.14.55.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 14:55:36 -0800 (PST)
Message-ID: <e89dbc7b-b3ae-c334-b704-f5633725c29f@redhat.com>
Date: Tue, 25 Jan 2022 23:55:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] drm/panel-edp: Allow querying the detected panel via sysfs
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
References: <20220125135406.1.I62322abf81dbc1a1b72392a093be0c767da9bf51@changeid>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220125135406.1.I62322abf81dbc1a1b72392a093be0c767da9bf51@changeid>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 robert.foss@linaro.org, Thierry Reding <thierry.reding@gmail.com>,
 jjsu@chromium.org, lschyi@chromium.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Doug,

On 1/25/22 22:54, Douglas Anderson wrote:
> Recently we added generic "edp-panel"s probed by EDID. To support
> panels in this way we look at the panel ID in the EDID and look up the
> panel in a table that has power sequence timings. If we find a panel
> that's not in the table we will still attempt to use it but we'll use
> conservative timings. While it's likely that these conservative
> timings will work for most nearly all panels, the performance of
> turning the panel off and on suffers.
> 
> We'd like to be able to reliably detect the case that we're using the
> hardcoded timings without relying on parsing dmesg. This allows us to
> implement tests that ensure that no devices get shipped that are
> relying on the conservative timings.
> 
> Let's add a new sysfs entry to panel devices. It will have one of:
> * UNKNOWN - We tried to detect a panel but it wasn't in our table.
> * HARDCODED - We're not using generic "edp-panel" probed by EDID.
> * A panel name - This is the name of the panel from our table.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Should this new sysfs entry be documented in Documentation/ABI/ ?

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

