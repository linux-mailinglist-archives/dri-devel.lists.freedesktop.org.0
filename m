Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAA25591C5
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 07:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B132210FAB0;
	Fri, 24 Jun 2022 05:16:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0758F10FAB0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 05:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=qlmkLyJRhSeuQxkZdXhXV8DVhshyN3x7xncZXU9np+M=;
 b=FyIYEavTH3oReAuiyM4OhCrcIqDYmh6AtyrySY+fWp4k0WW9WAALqWs9FXSjnm4HvzphQZ7lMYcUE
 E/EARGlLEmhW0tpJc4D3Ton85VCMbxX5BKmU8KVMygLM57v5fpokjJEH8dn666yBPJlR3snetcuMz1
 Bxpui4Fd0/hPIH5uNbIUddMWxUH6kQWs+1dptGcgQ5x2wmTkBxMyEwxrOzScLSO4lv3OvX/v9fPHVh
 x7ZiYLfTju10d1wOlzQ94PKQtRyVvcaDcx3JclfxM9XT9MENtIoCynlc+MO3YuSY18KnAjPRgAOsby
 63q2XTwlUhQSAO7ZEzxt2m0lVdj8pog==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=qlmkLyJRhSeuQxkZdXhXV8DVhshyN3x7xncZXU9np+M=;
 b=2581MsfV3inKWlgAS3AbLZeVACPsftUOfJQ+fjh8W0IWcG4xMzYGgeXEWyc9N00G1UqPAGaKzk7FR
 b4KEurgBA==
X-HalOne-Cookie: b146cd0f63cfa5cce4ee65422c34cd306858134e
X-HalOne-ID: d23d2e04-f37c-11ec-8232-d0431ea8bb10
Received: from mailproxy4.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id d23d2e04-f37c-11ec-8232-d0431ea8bb10;
 Fri, 24 Jun 2022 05:16:37 +0000 (UTC)
Date: Fri, 24 Jun 2022 07:16:35 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Kevin Brace <kevinbrace@gmx.com>
Subject: Re: How do I gather up new code to be converted as patches?
Message-ID: <YrVIs89I0aIR3lRh@ravnborg.org>
References: <trinity-356e941b-2ee3-4974-944b-5495ba4d00b8-1655918337996@3c-app-mailcom-bs16>
 <YrNaJBiAEKaoreGw@ravnborg.org>
 <trinity-de86d66e-c2f7-4643-8a47-4771e9751cfd-1656026260387@3c-app-mailcom-bs15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-de86d66e-c2f7-4643-8a47-4771e9751cfd-1656026260387@3c-app-mailcom-bs15>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kevin,

On Fri, Jun 24, 2022 at 01:17:40AM +0200, Kevin Brace wrote:
> Hi Sam,
> 
> Okay, I think what you proposed works out for me, although adding 20+ files, one by one, is a pain.

Posting one patch per file works - but sometimes it just makes more
sense to group some files. The process is more or less the same
and it is up to you.

I looked briefly at the link provided in another mail.

It will save you some feedback if you make the files
$checkpatch --strict clean before you submit.

Maybe I confuse this with the older branch I looked at first,
and the current code base is OK.

In drm land most new code is more-or-less checkpatch --strict clean.
There is always the corners cases so do not aim for zero warnings.

	Sam
