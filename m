Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82343C9D0A1
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 22:18:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071FB10E6AA;
	Tue,  2 Dec 2025 21:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tam4mmsB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206AF10E6D3
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 21:18:31 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-7866bca6765so51201627b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 13:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764710310; x=1765315110; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FYhGqDRGCK+cJn0UnOIQPro7GrvnzPHTnrrQsLBmDCo=;
 b=Tam4mmsBOAq86AI2Y/O1he6wiY35EOpR+ZBhkFoxEbDlg1hIPKKBZVGNV7NRCX26Vh
 OoqfeAZ10dqmKwpFlrRkPlc/S5SamiIoBLdTbk33HoiRzwXz9vP462N6RXdMyJKoU1U3
 uNuq2/b90TqjXNXRhdk9NewfeGLwpNGGNa20I+31IkNsXiaW/DnoGPW49HcUYrv0NVMd
 8tdemg4FegZ0Hpn07j4wOMR5YFn9fP/JQNHH+W8Rw4Qvo/vhbAJzulZ5jNc5iCpTze8p
 BjJkFm2GBSIcdI3JdlfLPPdhLjC0nKLLwoeb7FMbvpMFaX+5Ku1tl1GUJbU25QyvT4J1
 +gaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764710310; x=1765315110;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FYhGqDRGCK+cJn0UnOIQPro7GrvnzPHTnrrQsLBmDCo=;
 b=nGE2hFxOH6RUv21DqRC3DpkVdBBcBD46TEYkuui/4bOueTDgdFTNP73X8WTgT25ldE
 YWCuNHgQJ4GLYnxMYK7KTz5GWGPE1bONNy3/52WAJATOskYTtOaJj4PiP4BJUsmO9//L
 dZotfrpbqqORgsSoUhQJbSNNIKmVRyl5PZH1NwCjm+Qjq3enI1QMTOqrUa/UZfrxiOLi
 2WbnlJpt2rzhZ8FoUx81S36X/2cV5Du8W9Gahwpn5k5nR1NRS4xIyVCrJr6B15elxxkS
 EmM0G30C8KEkvPP8/uhdh9+naSx+yg08akbQur2A2+lFnZXoyqeBTvuGaTJluAQbKuJJ
 hOnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyOvGwwGMqJMA9UkOzAdmNZjdJUCk7PTwnMATNnzW0w24enRilf9Wl8jbH06RlJB5BCXggX63H8AA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYYJUDfqH+lht9o1y6P1BTx9YJ77dDjTzibfL7/HfOtWddWur4
 AlX+18sbWwYNbDEhaSikdlNQI139wFOwOgQ0EGeiqS+xq0g7PjRAkfSr2mgy/A==
X-Gm-Gg: ASbGncuBlFH83PEqAzPYe6ZkfXcyuFb28WXfpBJNg6fkoeq1T+uK7LpmSYJfJjiu2sl
 t+Z+nEwrjeQ38JDcgbJpe6gmHWwLsiyICEoEUJVK8zW/4kdDRFmZHKYPxUbFBiBqUVsoim6TCTo
 Dql/ditbgndA7qz7MBSh1NIl152rdjQ/jTii9alSh9Y3bhg+aUlwFTzrJnDGdj+jLVvNSgSO2qZ
 SmvgEHwaDcTkQqSqsh3rQENNdyQMb2PbhykE05by3DFklvY/6C7ByBF9G0aGgu8nC59Pk4oR+rK
 Egoel0xW+puxKvtOr35HFYv62usXPhBrWVB+PKRzJJkcAEoTdcf6vWf591nqu6KaHshVT6hxM8B
 TWjmoYgWJXblVVd/WsN6OgQWcRveIGDl3EfPbJGEd0xq9AZ42ArNxS4CsSYezYGt6apsB506O30
 Yv8YE9AQs=
X-Google-Smtp-Source: AGHT+IEHsQzpfTBjBHA4dtIeH7oiiPcnL1uTXbBAuV28ldULX2+K4VUyMpGMegei8EdtYuGbElbA8Q==
X-Received: by 2002:a05:690c:6f13:b0:786:7aaa:a070 with SMTP id
 00721157ae682-78c0beeaf33mr40397b3.10.1764710310027; 
 Tue, 02 Dec 2025 13:18:30 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:3422:8bf9:97bc:b085])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-78ad100e937sm67330467b3.27.2025.12.02.13.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 13:18:29 -0800 (PST)
Date: Tue, 2 Dec 2025 16:18:29 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] kernel.h: drop STACK_MAGIC macro
Message-ID: <aS9XpaiGXn2upVKB@yury>
References: <20251129195304.204082-1-yury.norov@gmail.com>
 <20251129195304.204082-2-yury.norov@gmail.com>
 <d854dadd78a43f589399e967def37a0eda3655c2@intel.com>
 <3m64k5fagw7hp2duo43t5fldyn6argdjripx3nn6onxbr6xu6w@iwiepyn5krf6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3m64k5fagw7hp2duo43t5fldyn6argdjripx3nn6onxbr6xu6w@iwiepyn5krf6>
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

On Tue, Dec 02, 2025 at 09:58:19PM +0100, Andi Shyti wrote:
> Hi Jani,
> 
> On Mon, Dec 01, 2025 at 09:46:47AM +0200, Jani Nikula wrote:
> > On Sat, 29 Nov 2025, "Yury Norov (NVIDIA)" <yury.norov@gmail.com> wrote:
> > > The macro is only used by i915. Move it to a local header and drop from
> > > the kernel.h.
> > >
> > > Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> > > ---
> > >  drivers/gpu/drm/i915/i915_utils.h | 2 ++
> > >  include/linux/kernel.h            | 2 --
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
> > > index a0c892e4c40d..6c197e968305 100644
> > > --- a/drivers/gpu/drm/i915/i915_utils.h
> > > +++ b/drivers/gpu/drm/i915/i915_utils.h
> > 
> > i915_utils.h is on a diet itself. STACK_MAGIC is only used in selftests,
> > please put this in i915_selftest.h.
> > 
> > I guess also need to include that from gt/selftest_ring_submission.c,
> > the only one that uses STACK_MAGIC but doesn't include i915_selftest.h.
> 
> Doing this cleanups is a bit out of the scope of this patch.
> Given that the patch itself has quite a good consensus, let move
> it forward and I can take care of the i915 cleanup once it gets
> merged.

I'm already testing it in my tree:

https://github.com/norov/linux/tree/sm1

If everything is fine, I'll submit v2 with this change, otherwise will
schedule it for future improvements.
