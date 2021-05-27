Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3071392BD4
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 12:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86796EE62;
	Thu, 27 May 2021 10:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3536EE62
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 10:29:14 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id e17so241440pfl.5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 03:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=l9Q90fGTdqRxJNMjjDNRJNKXXHuzzfmziiIyuJGZz28=;
 b=JeDwCmVrF3cAIe20Y8v6csEq5BP6OQZYLyX2uLt8xF47jzF3YQrzU2T60otwqwKHRY
 xzWTyKoT7+oRFNq2L0ki5TZ+KCSEWggcaM/w8dowB7A+SW3pBqDJbhemrDIWHyY0Ev5l
 Z8+yGGtYWFgVvKOC3MM7htXC2fqB/wBG1XAU9p65MEnhpmMBgx/1/Agso7R9sAOFOBEI
 obf94KsleYAfQKpG1oYGQwaIYMzMbsn19XVXV3yJkURHvu2yQBsIDldadZZbrFyAcNJB
 nWUcBy6s0YSbmk4hyi18VDbeRPJWKlUMp2NlqVCZQGicV4Kg2aij6lbwynrmbQFMTxZ8
 /4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=l9Q90fGTdqRxJNMjjDNRJNKXXHuzzfmziiIyuJGZz28=;
 b=uM9ycsLbzb/Jrl9058FHlrfN+4VgcTSzNpRdRABKLI99SZJfftX+icW8vxzuYRORfC
 vt4+LroJBinFzCSP+y7f0zMXP8v/Os2Y2HD+L+YFgv6SpZuNNje8/Dgcb21KOB2B2Pv8
 jnjPsNMRgPqNM/xjZ/gHZFiCJbjLqdkfvh5BXsvcwM8G4bPGZOXdyKw5sdwBnLGVQHA/
 hlKyxUQJ5y5Ay2qE5Zj5OamUsf03u83t6C3UPTt2Abgsdwv/Mzb8WH39yBtlUReg0YIS
 StMfDqT7uI6qvR0OTKbuATK02EWjuLP1mEDx3jEz0n7JVvs+2j0UOPOsWGtO13gXO8/k
 gn1Q==
X-Gm-Message-State: AOAM532sIVfepM99RGnLldoIhQqSqaI51nNB06FIhN1wT3C7fq/BE/tF
 dQXbLGLHiir+4qZlkUKLNPE=
X-Google-Smtp-Source: ABdhPJxK7y+PEYXzQxry0qkGQCIv/0DYD+75J4NqB+1EoPFJfEj36dUTXakLlyW5WGrvzYedegKDDQ==
X-Received: by 2002:a65:564c:: with SMTP id m12mr3152032pgs.298.1622111354308; 
 Thu, 27 May 2021 03:29:14 -0700 (PDT)
Received: from [192.168.1.8] ([50.47.106.83])
 by smtp.gmail.com with ESMTPSA id n8sm1580788pfu.111.2021.05.27.03.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 03:29:13 -0700 (PDT)
Message-ID: <0e449c3d589d8999ea5ee392f2b72b437f65a604.camel@gmail.com>
Subject: Re: [PATCH v5 1/3] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
From: Deepak Rawat <drawat.floss@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Dexuan Cui
 <decui@microsoft.com>,  "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>
Date: Thu, 27 May 2021 03:29:13 -0700
In-Reply-To: <b093d480-c3f1-f2f7-1107-60195c0bea0c@suse.de>
References: <20210519163739.1312-1-drawat.floss@gmail.com>
 <MW2PR2101MB08920209B00F7692FA83BBD0BF2A9@MW2PR2101MB0892.namprd21.prod.outlook.com>
 <b093d480-c3f1-f2f7-1107-60195c0bea0c@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 
MIME-Version: 1.0
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
Cc: Michael Kelley <mikelley@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2021-05-26 at 21:42 +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 20.05.21 um 07:41 schrieb Dexuan Cui:
> > > From: Deepak Rawat <drawat.floss@gmail.com>
> > > Sent: Wednesday, May 19, 2021 9:38 AM
> > > ...
> > > +static int hyperv_vmbus_suspend(struct hv_device *hdev)
> > > +{
> > > +       struct drm_device *dev = hv_get_drvdata(hdev);
> > > +       int ret;
> > > +
> > > +       ret = drm_mode_config_helper_suspend(dev);
> > 
> > If 'ret' is not zero, return immediately?
> > 
> > > +
> > > +       vmbus_close(hdev->channel);
> > > +
> > > +       return ret;
> > > +}
> > 
> > 
> > > +MODULE_DESCRIPTION("DRM driver for hyperv synthetic video
> > > device");
> > 
> > s/hyperv/Hyper-V ?
> > 
> 
> Maybe let's fix these points and then get the driver merged.

Hi Thomas, sure. This was on my list to fix before merge. One patch is
missing ack/review, so it would be nice if that also is reviewed.

Thanks,
Deepak

> 
> Best regards
> Thomas
> 


