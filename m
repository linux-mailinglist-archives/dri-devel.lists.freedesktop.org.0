Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCF1119AA9
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 23:07:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC29F6E9B7;
	Tue, 10 Dec 2019 22:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959EB6E9A8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 22:07:21 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id d16so21822131wre.10
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 14:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ptJt8UpVUt+TvsYxm4J67mpF+rXHgp/cv7qqisG2GRA=;
 b=MLqUObJ81drA0eXJYbMdW3P0zg6k8UvIqavv4+NEHMpFk4uQOUZM7AGGn3WZh9Rzhw
 3n7GQu7QWCgx5eJF+hEeogaeMdL8wEC9aboR36ORSxBVWW0QUGNUL9e2coaTG/3YiJf8
 EZcOhd0479ECh+LpXm5g9vv7B9kML+CXHgzdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ptJt8UpVUt+TvsYxm4J67mpF+rXHgp/cv7qqisG2GRA=;
 b=ndYI0EndcszxHthgVaFCa1uo5ENN08qEYc126BsDlgmsED7m3knxWDO6bwlcr08Ieb
 g4sSLrqtl410lab1DqxHUy+JZBdHUN3N8xhOmz8UUasQ7xZxLl9n1tcSfJLiyYqds6Ua
 9iPyRcnrxJAhzTZ0F4/m2JxXJGKZtjhMbZQjVQggMi5U4V4Ykg7vqXMnskif+vNevQk5
 pXogqDaCEjobG1nttZiztZ1CYVt/Rc9wYIUhDU5fOitue54KFiYj3X2GDfzMGnSPq3RC
 zabas9FHbaVZmYt3XihDjbQhwo8jIuhNC6V5Yfk6pZ0jf+l1HVfmf3KsyzJqzAisVCL1
 AlTQ==
X-Gm-Message-State: APjAAAW4+BqtFwtb9SmdpL5GW6teEb7XepXcN8SPmNXj4TJQ/in00LCE
 7K4PAjV51TzRbxwSXCkm9IqPYw==
X-Google-Smtp-Source: APXvYqynFrQ1Q24pQQUBBH9773aGTAM/uCSmsEgciUNVh+e4sR+Ktxs67mwOB7Q0M250Fg24lexTWQ==
X-Received: by 2002:adf:db41:: with SMTP id f1mr5868055wrj.392.1576015640314; 
 Tue, 10 Dec 2019 14:07:20 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id c15sm4822185wrt.1.2019.12.10.14.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 14:07:19 -0800 (PST)
Date: Tue, 10 Dec 2019 23:07:17 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 1/8] drm/print: introduce new struct drm_device based
 logging macros
Message-ID: <20191210220717.GW624164@phenom.ffwll.local>
References: <20191210123050.8799-1-jani.nikula@intel.com>
 <87o8wge4va.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o8wge4va.fsf@intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: Sam Ravnborg <sam@ravnborg.org>, intel-gfx@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 10, 2019 at 02:34:33PM +0200, Jani Nikula wrote:
> On Tue, 10 Dec 2019, Jani Nikula <jani.nikula@intel.com> wrote:
> > Add new struct drm_device based logging macros modeled after the core
> > kernel device based logging macros. These would be preferred over the
> > drm printk and struct device based macros in drm code, where possible.
> 
> As to cover letter, patches 2-8 using the logging macros introduced here
> are just the beginning. It's not trivial to write a cocci script to dig
> up struct drm_device * where there is none, so much of it may need to be
> done manually. But we could start here.

Can you pls do a patch for todo.rst to adjust the existing task to the new
flavour of favorited debug printing? If cocci doesn't work we can at least
throw random interns at this for starter tasks :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
