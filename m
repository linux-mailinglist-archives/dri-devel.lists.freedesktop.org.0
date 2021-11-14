Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C54E444F9CB
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 18:35:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9CA89F6B;
	Sun, 14 Nov 2021 17:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B0489F6B
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 17:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
 t=1636911295; bh=SmXZv5ze310+2u3HmDC9MzRY7EBw1Wd/2N5JgnjTODo=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To;
 b=MwkO55TfXVXpZgynqrQ4teUCYXvrzQWB03RMg85U929j6MGm0l4Spk0mpV8Igp6Of
 dz6S5Q53jGonOtYoyeYeiK94/Q7kiRBvRoEH+0ZGkgXVqNVJUOBuAzUWmYLMGJGcNp
 TMALaKaP+UzDZ2SiIyb4q0UVvKQjtpl1zcq3ADbc=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Sun, 14 Nov 2021 18:34:55 +0100 (CET)
X-EA-Auth: T8L/LLLXrQD9iHJOYtrktvGQqjlK1Yf1zuqU1M303GUMzWW/sA6M9aLdZX33WnT8L7JpdaTpC4sZUS2B/YnjGme+4V1Oh4tY
Date: Sun, 14 Nov 2021 18:34:53 +0100
From: Claudio Suarez <cssk@net-c.es>
To: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm: change logs to print connectors in the form
 CONNECTOR:id:name
Message-ID: <YZFIvfY1j0f3pVQt@gineta.localdomain>
References: <YZARol5A5hS+5a5m@gineta.localdomain>
 <YZAikieq4bwrJ58c@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YZAikieq4bwrJ58c@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 13, 2021 at 09:39:46PM +0100, Sam Ravnborg wrote:
> Hi Claudio,
> 
> On Sat, Nov 13, 2021 at 08:27:30PM +0100, Claudio Suarez wrote:
> > The prefered way to log connectors is [CONNECTOR:id:name]. Change it in
> > drm core programs.
> > 
> > Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Signed-off-by: Claudio Suarez <cssk@net-c.es>
> 
> While touching all these logging calls, could you convernt them to the
> newer drm_dbg_kms variants?
> DRM_DEBUG_* are all deprecated.
> 

Yes, I can, but it is recommended to do it in a different patch:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#separate-your-changes

C&P:
"Separate your changes
Separate each logical change into a separate patch.
For example, if your changes include both bug fixes and performance enhancements..."


I will study and send a new separate patch with your suggestion.

Best regards,
Claudio Suarez



