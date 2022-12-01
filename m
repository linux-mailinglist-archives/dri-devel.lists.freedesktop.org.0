Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6693963F280
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 15:16:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3EF510E5F5;
	Thu,  1 Dec 2022 14:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9115010E5F5
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 14:16:45 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id h16so1054063qtu.2
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 06:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ByBUzDvzM4j/gp90rEVsVwRt5tlydokLLLhC4JKYf6Q=;
 b=ALKYG2D/tADzmmrBG2F3xseeZLU9Pndwb16fHF0A/f7XQgK5jyMFTwdCUz0xY9OoVp
 cREeQQ3+FW0jrwzLfQ/2wqFV6IBhYQF7vbaPcJwfsNL060cwpUnIhYMg0wAgvWz45uBc
 N7bAvldEO4GvHVLo0aBH48ATa64osjZndwqLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ByBUzDvzM4j/gp90rEVsVwRt5tlydokLLLhC4JKYf6Q=;
 b=hGuS7Vq+spvKEUCtCwfzAHcGuO+4KDy2HwrBqkJdR8P8n9DJvuiYCE8/oUCZ6BYN2G
 lDc2F03d3hos/A7NvTGEQPFOh+ihflsr2f+bAePLTg5z3KSCRyrwHKA5baeeya2hgyOi
 cqflsG+ZbROQdKobd+9EeC2OjSbwQVDx/G2ypng533pJfKNIE0oNSNOe2VORb0M9EMRf
 PPVp3//wW6AG2x/14H79HwHmShSnlUELYAX7mpjaP2KBKJAXWk0vgX4/Xw1SBp/Ls2A5
 hFoZ2Et+dsJvDql9MakfOMgY2nUtqQkN20kvRcivCv9TrFk01xRC0tNUKrRJ4vDBnpTb
 T+Tg==
X-Gm-Message-State: ANoB5pnqg2pcYv+rXbXwQzhwe2FEzURxwgKxjBDvLqiadaYLdNmfnmTk
 owFooHIRKLlRbn7Mm5fi8phTSA==
X-Google-Smtp-Source: AA0mqf4sje8Z+QezshaWc/1aH17c3fAMaRO7YFMGMDGpOgxLC6kxNdCsPxqps85W5A5wbu9nD4HftA==
X-Received: by 2002:a05:622a:4114:b0:3a6:94b4:bb11 with SMTP id
 cc20-20020a05622a411400b003a694b4bb11mr1505998qtb.539.1669904204490; 
 Thu, 01 Dec 2022 06:16:44 -0800 (PST)
Received: from meerkat.local
 (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
 by smtp.gmail.com with ESMTPSA id
 bi13-20020a05620a318d00b006fb0e638f12sm3554530qkb.4.2022.12.01.06.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 06:16:44 -0800 (PST)
Date: Thu, 1 Dec 2022 09:16:42 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 0/6] drm/gud: Use the shadow plane helper
Message-ID: <20221201141642.uvonbrny4rhuacl5@meerkat.local>
References: <20221122-gud-shadow-plane-v2-0-435037990a83@tronnes.org>
 <Y4hB5odv9IGaq3Di@kroah.com>
 <1cb40762-5f0a-1739-1670-155f59ec7110@tronnes.org>
 <Y4iaODY6hMVNsfP1@kroah.com>
 <4e75582c-b3d6-fb0e-19b4-e4fd58c6bf55@tronnes.org>
 <Y4iqR94aGFa3NahQ@kroah.com>
 <e57deac6-5344-3f81-8ef5-55dd28b8c363@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e57deac6-5344-3f81-8ef5-55dd28b8c363@redhat.com>
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 tools@linux.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 01, 2022 at 02:34:41PM +0100, Javier Martinez Canillas wrote:
> >> Konstantin,
> >>
> >> Can you add a rule in b4 to exclude stable@vger.kernel.org
> >> (stable@kernel.org as well?) from getting the whole patchset?
> > 
> > stable@kernel.org is a pipe to /dev/null so that's not needed to be
> > messed with.
> > 
> > As for this needing special casing in b4, it's rare that you send out a
> > patch series and only want 1 or 2 of them in stable, right?
> >
> 
> Not really, it's very common for a patch-series to contain fixes (that could
> go to stable if applicable) and change that are not suitable for stable. The
> problem as Noralf mentioned is that the b4 tool doesn't seem to allow Cc'ing
> individual patches to different recipients, and everyone get the whole set.
> 
> So either b4 needs to have this support, exclude stable@vger.kernel.org when
> sending a set or stable@vger.kernel.org ignore patches without a Fixes: tag.

I think what I can do is a special logic for Cc: trailers:

- Any Cc: trailers we find in the cover letter receive the entire series
- Any Cc: trailers in individual patches only receive these individual patches

Thank you for being patient -- we'll get this right, I promise.

-K
