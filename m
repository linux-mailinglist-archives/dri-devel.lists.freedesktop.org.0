Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4BF86746E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 13:09:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65EE110E24B;
	Mon, 26 Feb 2024 12:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="GruPkY5t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129D910E24B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 12:09:52 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-42e848fc6f6so5794171cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 04:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1708949392; x=1709554192;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n6Pm8rj+PxlJDm/+v2Nc3PvIGgz+GsGPsoihKku3L+8=;
 b=GruPkY5tCOSMJ/m6f3Sz0FAc2rzq1MjHHMHZJ11sXJntbFzT40c2IcTIoYWeIXurFS
 40rShF5OqpDi+C1wSNqItx9mlpCpxt+bpZL0dHIWsVKoeskJs2UglIkBsmKMQMkZvPMj
 rimct/eE0ft10HQ/YIHDyNsxrDJLerD1wlAf3KmT/7yo7vUFteso8d++pEUJagVy9Tmi
 7e3RJG8s67yYH12qmtaVYFhrGK7XsLMjWsF8595OfB8hYGq/IC6/pnsFZ7KnO+F3bdIF
 Xbz6RzW6lIuCq92LE0VbtTSujGpEVN1+xQ111/1dCeFdgMWPn2+dms/oRkmq5uJvJSuT
 SxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708949392; x=1709554192;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n6Pm8rj+PxlJDm/+v2Nc3PvIGgz+GsGPsoihKku3L+8=;
 b=at/prhQWy5StUAlr/9Rvkeqgdu5p9k5yczerliCkj/8WSrUuKLd2LfwB94cut6yXcv
 EO1GBP3r6KvVQSAFoTefFGWCu6lEBTOjE8L9sb3HPOZhhp5tzT20YebbRt2SBbgwYFsG
 mK7Dw4FNgC76UUjstkd6vMZC894WjwqmNf6Ni8mJEWW9hZ22tICU4dAG6tSSM5qQCX+N
 8QRFWgc8t0QdL8FcVIFM6sk5OP3QxZdykRfyPRFviL2cRiR6UuGbyLiS906MjJsnm46p
 mKJLWidMuYoIgHwfjab3TKyA+Nxfep6mMG/a/0T9FHW1KyICLNPa/Uha8yKkzE5Ay7Cp
 rDnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuF0dHKS8i0nSThhJBJO5hSB7VYFod3Ezj+0n2GGZINIBgkkAtHqqnYimPApKXn9/K7yPPLqbpenFJDskt7WVC4nWdfWiEXF+dz9zcND5c
X-Gm-Message-State: AOJu0YyUj3Mqbejy1sbST+I3xEtKHfyzRHVhYqv3UHMG7C6LiB6vKv37
 4VsYQbabmd79pHkLBxEvLmLOf2qHAzmXYGVXiYOmx3GJSZKAlIBhABuAfCNUWR7q1b9LHdwP5kj
 lMNM6C6knfdH5ohSQOD8MSvwLWvNSUzVqwOgGDw==
X-Google-Smtp-Source: AGHT+IHgylEl5DcJIccCG3m145uKND/U9cWYsLaVlQuVvp1aXDncO399ynhumpgQfKwv2qrWzh0qXNU+7ZiPi6RFbx4=
X-Received: by 2002:a05:622a:1190:b0:42d:c712:ce76 with SMTP id
 m16-20020a05622a119000b0042dc712ce76mr9940128qtk.4.1708949391938; Mon, 26 Feb
 2024 04:09:51 -0800 (PST)
MIME-Version: 1.0
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
 <87bk83o3y3.fsf@intel.com>
 <oazstrooilko4tfmead3b4l32tmz3szqpwgzy3kyga3xahjjfw@cbosrrwaul77>
 <871q8zo2tn.fsf@intel.com>
 <CAPj87rPB9+o1g8gJyZk3m2DLhW=FC+3m5Nrm=Mxq3SwqxX3KCg@mail.gmail.com>
 <87y1b7mnyu.fsf@intel.com>
In-Reply-To: <87y1b7mnyu.fsf@intel.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 26 Feb 2024 12:09:40 +0000
Message-ID: <CAPj87rN8DY5jYsRLC7hLCaXwsoHOALnjTrwpKLCxm0jRG6qb-Q@mail.gmail.com>
Subject: Re: drm-misc migration to Gitlab server
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Stone <daniels@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 26 Feb 2024 at 12:03, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Mon, 26 Feb 2024, Daniel Stone <daniel@fooishbar.org> wrote:
> > It's a fair question. If you want to verify that someone is
> > @intel.com, maybe get them to email you out-of-band to check it. If
> > you want to check something else, just ask an admin I suppose.
>
> I thought you wanted not to be bothered with access requests! ;D

Hey, we have like four other people with GitLab admin privileges ... I
just want to not have to deal with LDAP mainly.
