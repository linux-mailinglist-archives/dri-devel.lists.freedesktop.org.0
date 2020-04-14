Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7525D1A7AE0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 14:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110746E06E;
	Tue, 14 Apr 2020 12:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083A189B99
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 12:34:09 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id h26so2711701wrb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 05:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=/0jr+GG3LyvDkB/zvwi8pImlCt3g6GJqvkh08zDnpzk=;
 b=Y8MoA+jt5jFWw7uXusRhRJQ8ORQ00uQOwPjwmK0LCFbnGb/MKF4Hzd/Qj/EYMROORR
 uqJopqMXSv/roMf7C+iiqZZvRfqv48qxA07Kg/3ftbyBgJNlGOf6ctCXoiquytT6liQ+
 2DyBWTGgZbV4qBp0S4Yn60sxJYWX7VgFqK/Jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=/0jr+GG3LyvDkB/zvwi8pImlCt3g6GJqvkh08zDnpzk=;
 b=chZf57GhtGXza6dc20LGQmbQEgHF1aUWQy+XrniCw1sBt9eo119+KY16bMR87CSPH0
 tmoCHMQuHlGgCl3Q9BDfZFxTmHueI6jSUXmGEv98YzLdKW/wMV8dQDC+tIDNdv0/nNFB
 N1V1Gn0SVsRGh2qG01+/cdS3QLhgwa4dVi2cGQgtpYEZ+nnl4WWQ5kmWVJEBb32NjEY5
 MTYyiIWKqKxnSWckMYsb8IIQ0cRMTMOnxKNe3mvNZXAPRaeXUS+bjH/8/iwCVVuI/tLZ
 fOYL7FR51JSsKblQ76jxYUkqAmBtU6nQFpHQYkOLJquUSXNLoSKoMUD4iKjLSaBRixCo
 9QyQ==
X-Gm-Message-State: AGi0PuaVxmxX0mloUjMh9iyPLoPhLcxGUYJZW3rhB0YKdtqlxrs3vW6N
 8wru9u7WMd8vIZJ4e5hHdPKtqg==
X-Google-Smtp-Source: APiQypLhB5mouYy4rFQGtlVpSX6rVjC9jg0eJ/6UH9dcaDMtkDp3vzfrksr11KLN6Er/jKfsmK4Y0A==
X-Received: by 2002:a5d:42cf:: with SMTP id t15mr10089331wrr.354.1586867647689; 
 Tue, 14 Apr 2020 05:34:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q17sm10461927wmj.45.2020.04.14.05.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 05:34:06 -0700 (PDT)
Date: Tue, 14 Apr 2020 14:34:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 5/5] drm/i915: Replace "Broadcast RGB" with "RGB
 quantization range" property
Message-ID: <20200414123404.GT3456981@phenom.ffwll.local>
Mail-Followup-To: Jani Nikula <jani.nikula@linux.intel.com>,
 Simon Ser <contact@emersion.fr>, Yussuf Khalil <dev@pp3345.net>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20200413214024.46500-1-dev@pp3345.net>
 <20200413214024.46500-6-dev@pp3345.net>
 <daCvJk4O6rHOwEometGSPENJupb6adPr583_dLEetvftUQPbK4198VDijHGzM9uTm9bP3TEyGCZvxKe5PSvqWBg5xhXkL_7EiAQlmEPKWQI=@emersion.fr>
 <87ftd6mi3e.fsf@intel.com> <87d08amhy5.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87d08amhy5.fsf@intel.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Yussuf Khalil <dev@pp3345.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 14, 2020 at 02:21:06PM +0300, Jani Nikula wrote:
> On Tue, 14 Apr 2020, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > On Mon, 13 Apr 2020, Simon Ser <contact@emersion.fr> wrote:
> >> On Monday, April 13, 2020 11:40 PM, Yussuf Khalil <dev@pp3345.net> wrote:
> >>
> >>> DRM now has a globally available "RGB quantization range" connector
> >>> property. i915's "Broadcast RGB" that fulfils the same purpose is now
> >>> considered deprecated, so drop it in favor of the DRM property.
> >>
> >> For a UAPI point-of-view, I'm not sure this is fine. Some user-space
> >> might depend on this property, dropping it would break such user-space.
> >
> > Agreed.
> >
> >> Can we make this property deprecated but still keep it for backwards
> >> compatibility?
> >
> > Would be nice to make the i915 specific property an "alias" for the new
> > property, however I'm not sure how you'd make that happen. Otherwise
> > juggling between the two properties is going to be a nightmare.
> 
> Ah, the obvious easy choice is to use the property and enum names
> already being used by i915 and gma500, and you have no problem. Perhaps
> they're not the names you'd like, but then looking at the total lack of
> consistency across property naming makes them fit right in. ;)

Yeah if we don't have contradictory usage across drivers when modernizing
these properties, then let's just stick with the names already there. It's
not pretty, but works better since more userspace/internet howtos know how
to use this stuff.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
