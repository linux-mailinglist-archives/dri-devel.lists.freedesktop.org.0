Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E01902FE93E
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 12:49:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF2D6E833;
	Thu, 21 Jan 2021 11:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3016E833;
 Thu, 21 Jan 2021 11:49:51 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id m22so2101013lfg.5;
 Thu, 21 Jan 2021 03:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5RQ3dZ9V+4H622pwrLJOT/5mi2FLMEQRPOfPaSG6GIk=;
 b=aFeLc+koJ4b8P4Dp8DvQABAO1iKIfXqM61V5AtF/oCAcOu4c727wmyfin8d54IXRp6
 fqFFMQKxMrZLG1xnlQLMSR1HSlVDdU6Fo9E9dxsNeAUY2D9BVUonfjUd3NS7svJfcFCL
 fZi6f/4wNuhxHVppFLpRIkVeErTKjtLhnTo+KwVnmQUtseJuBp63DJPtKx8xmYxriHaN
 NyYsIY7kc2hb1SjgJV31W4H6T/oNnvMPsfFtPyXHzguDZc+DRWoSPRrKgjaOA32dF55Z
 Dq5N6uPryEue1I9fRNJ4IPmzMT2yON73VvXhd3LYu+sT9BJ486gBiwcOZ8UG9QQ+ybqm
 dqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5RQ3dZ9V+4H622pwrLJOT/5mi2FLMEQRPOfPaSG6GIk=;
 b=tX5s+9eh64m67lLKhM/bJ1S3svS8Ypu2LfwewpiWCSu2ZaSV52f3aO648G8tZ5NREi
 aF7nOuLULvRJ6GdyFDbUQ7a5BmVdlVyvgAsmQpLtFdlSi/YDbvHYr6VPJspTuKIGJktS
 3hiCeZUgSpWyrMFIHKMGmPxqix6ulaN6QBcu7VrBS27jy9o4ZlQA2A0vh4eT4p5csTIF
 1tUw3YEYL9Qpni7QfL1GmrJ4SLndjflAchnDfRWLn3HkMaP/PQ/W+wMdw86eS8A9BKnc
 rRx7wYCjjMR2/yu46oyaH5Fbw55uwPX1NhXBrdBJrHEOEWz1NQF2i3I1ne4iIJJnYwTl
 5HVQ==
X-Gm-Message-State: AOAM530VYMLxDVM/At/fk28KHM2seyCO/KKNyJNlfo55PfuYNS1b8vvx
 G8FgImfNFf2eTxWc7nLaddUZX49eKwiJASEAponHqESN/BI=
X-Google-Smtp-Source: ABdhPJwbh8nh5mgue4Ai+hNZO2hVTDGReWvmZ+MyhMojSyFIC4LTiI2IE3kvd2uXo3byZ1l8oSfxpzpOPPnr7VjPPjA=
X-Received: by 2002:a19:e20a:: with SMTP id z10mr7012401lfg.295.1611229789884; 
 Thu, 21 Jan 2021 03:49:49 -0800 (PST)
MIME-Version: 1.0
References: <20210120110708.32131-1-jani.nikula@intel.com>
 <92f48ffdfa30c3941e0fd22337217f0b10d75ec8.camel@redhat.com>
 <875z3qmt5b.fsf@intel.com>
 <CAOMZO5Du9+DTYpuG3FNLRrO_LJVSJa3cdJWWwt_qzQDthGESkg@mail.gmail.com>
 <8735yums94.fsf@intel.com>
In-Reply-To: <8735yums94.fsf@intel.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 21 Jan 2021 08:49:37 -0300
Message-ID: <CAOMZO5DBXerrJEvvXnfzjB376SMKVJTyo9MRD0H0u9pz8p+2yg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: fix build after dp quirk helper change
To: Jani Nikula <jani.nikula@intel.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 21, 2021 at 8:41 AM Jani Nikula <jani.nikula@intel.com> wrote:

> On top of what? Current drm-tip?

It was on top of next-20210121.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
