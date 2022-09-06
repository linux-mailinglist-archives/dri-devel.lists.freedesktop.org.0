Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7515AF454
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 21:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5650310E8B8;
	Tue,  6 Sep 2022 19:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25AE10E8B8
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 19:18:13 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id az27so16908909wrb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 12:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=ldW0aueJLSvFBgFoP+jVpya8KF5NDDRSTKWLEKQB0Mg=;
 b=UfB5K2IGJ3KmpZjfe/zyCnJmZ5c3Kq9j3d+0Rv76CZxF3H96scfi3BURNTLXDCp8NZ
 hD/ENVoNsH9mTdc8HeffjfefDZYsneYwEiy7VA2JNg6h7d2JdxWyHUXiPlQLdz4EP5rw
 3mVD3HHGkOyrGMvtVhHpOPu/wTHimVHE+ZnGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=ldW0aueJLSvFBgFoP+jVpya8KF5NDDRSTKWLEKQB0Mg=;
 b=eet/VxkATrvbTlQk+IQe6xLkYXO5vMXGnQ3Krw1a2VlVbmd1vpX+O+jrkoLjK+o/EL
 BYGk9Ip9sOmsNFPTkXCJxHFi/NJ2N/bhO3t23ssrhdGdMdn3LgcI4Tb0i+JuY5m3l7hO
 fyzM4lcGZOLrKQejdrHJcDwbEp1ZD1t4iPkxSsEHbUPfb3iNDpEERVuepPMLMB2jEVTL
 2HnuvfnyAgX5SUQq7SD82LqHRuoC4WknOO1OXGiiQsjIRgbtWG9PwjjD22bv5d792Sgl
 fe/5GuNnjIcBxsjVUaTbDs7q4LFcWilrnAtf9Th+wDGXV3MYEwAi+Nix6vPOyTenrInc
 +Liw==
X-Gm-Message-State: ACgBeo2ta6vwN8t5G8SuAz0Kgi0OHkpC7k/xWEZ6oKGPPm61f0uRF9K2
 AeDbVe6MFmt8Vv/NxPDJKii5Qw==
X-Google-Smtp-Source: AA6agR7/xGFspJWbW+/38yyVTrYmpvw1aq1F4ekVwGK63qBo1VvKHy6ltg3qtJAHeQrqYUJh87qgVg==
X-Received: by 2002:a5d:6d8f:0:b0:225:6285:47fb with SMTP id
 l15-20020a5d6d8f000000b00225628547fbmr29375256wrs.211.1662491891887; 
 Tue, 06 Sep 2022 12:18:11 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 bd7-20020a05600c1f0700b003a331c6bffdsm15569682wmb.47.2022.09.06.12.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 12:18:11 -0700 (PDT)
Date: Tue, 6 Sep 2022 21:18:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 00/41] DYNDBG: opt-in class'd debug for modules, use
 in drm.
Message-ID: <Yxec8VRCQT5fJdqk@phenom.ffwll.local>
References: <20220720153233.144129-1-jim.cromie@gmail.com>
 <CAJfuBxxPRj-u5S45pPfAEaE46ji0--MTVxryEAUPe1+1c1jgEw@mail.gmail.com>
 <17628790-3905-460d-8734-981cfa8e7e51@akamai.com>
 <YvUz2Nk6YHl+jVwR@phenom.ffwll.local> <YvXtQ7/FJFSVXlGU@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YvXtQ7/FJFSVXlGU@kroah.com>
X-Operating-System: Linux phenom 5.18.0-4-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Jason Baron <jbaron@akamai.com>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 12, 2022 at 08:03:47AM +0200, Greg KH wrote:
> On Thu, Aug 11, 2022 at 06:52:40PM +0200, Daniel Vetter wrote:
> > On Wed, Aug 03, 2022 at 04:13:05PM -0400, Jason Baron wrote:
> > > 
> > > 
> > > On 8/3/22 15:56, jim.cromie@gmail.com wrote:
> > > > On Wed, Jul 20, 2022 at 9:32 AM Jim Cromie <jim.cromie@gmail.com> wrote:
> > > >>
> > > > 
> > > >> Hi Jason, Greg, DRM-folk,
> > > >>
> > > >> This adds 'typed' "class FOO" support to dynamic-debug, where 'typed'
> > > >> means either DISJOINT (like drm debug categories), or VERBOSE (like
> > > >> nouveau debug-levels).  Use it in DRM modules: core, helpers, and in
> > > >> drivers i915, amdgpu, nouveau.
> > > >>
> > > > 
> > > > This revision fell over, on a conflict with something in drm-MUMBLE
> > > > 
> > > > Error: patch https://urldefense.com/v3/__https://patchwork.freedesktop.org/api/1.0/series/106427/revisions/2/mbox/__;!!GjvTz_vk!UCPl5Uf32cDVwwysMTfaLwoGLWomargFXuR8HjBA3xsUOjxXHXC5hneAkP4iWK91yc-LjjJxWW89-51Z$ 
> > > > not applied
> > > > Applying: dyndbg: fix static_branch manipulation
> > > > Applying: dyndbg: fix module.dyndbg handling
> > > > Applying: dyndbg: show both old and new in change-info
> > > > Applying: dyndbg: reverse module walk in cat control
> > > > Applying: dyndbg: reverse module.callsite walk in cat control
> > > > Applying: dyndbg: use ESCAPE_SPACE for cat control
> > > > Applying: dyndbg: let query-modname override actual module name
> > > > Applying: dyndbg: add test_dynamic_debug module
> > > > Applying: dyndbg: drop EXPORTed dynamic_debug_exec_queries
> > > > 
> > > > Jason,
> > > > those above are decent maintenance patches, particularly the drop export.
> > > > It would be nice to trim this unused api this cycle.
> > > 
> > > Hi Jim,
> > > 
> > > Agreed - I was thinking the same thing. Feel free to add
> > > Acked-by: Jason Baron <jbaron@akamai.com> to those first 9.
> > 
> > Does Greg KH usually pick up dyndbg patches or someone else or do I need
> > to do something? Would be great to get some movement here since -rc1 goes
> > out and merging will restart next week.
> 
> Yes, I can take these into my tree after -rc1 is out.

[uncovering from an absolutely impressive cascade of holes :-(]

Did this happen and I can stop worrying here? I'd like to make sure these
drm debug infra improvements keep moving.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
