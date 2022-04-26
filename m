Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BCF5101E7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 17:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD18F10E7A1;
	Tue, 26 Apr 2022 15:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACE910E7A1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 15:29:29 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id v10so5265701pgl.11
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 08:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lZlT5pXPhHWSQcE2RTzBIz/G9KbrNns2EdBS7uY3x2A=;
 b=A0wOIbREZiPNRR1QF0NoGkT8Pnea9QnGqzGpH7RIUvzWOmDWmYwlkJKTI1rYUxe2ql
 lZD0v80/AgREwqwHoiSEd253EOQEtDoScWZ64Xaw4RffpeHpTAVYLTKkTeKp/c2artXO
 sPUmXYYnIozzL2qkIO51PtOf1hj0ORfI92gpl0YPzSatmZd91Foq403vBAh288rE0TSp
 jg5UyOzadMJXLUkBEFqOp4kH+RUweDN5DcNwel6bbmsZiseFz2aEnMYrLC6DEhWXFL34
 9soNzY/U7RhrjCk0SaNDJ/gWKsROUfivZMgxNTlj/XISyzKDIDfXQ/pa/ljWTXHdfGTY
 f6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lZlT5pXPhHWSQcE2RTzBIz/G9KbrNns2EdBS7uY3x2A=;
 b=PQXszfuBFEtUS95/R3+yIFAhlFyzZHlw1J4nHPEU7lzzm/AIniTPsuqkJ6P8SKuLAb
 CBlh0HIv8tHagmztAPNCuBKD7zWleGe0rhdx5S79I4VWdJBjm0nC54OhMNAlilYX8woi
 1D8+G6mQv9cfYZDuhoyXX1Xbqnn1246HTrooJ7fW82szOhYrDYYQmPjhUYxBhm4mMzPr
 DTW2HyFwa1qf2JMpW4sJq9lvRPufoB//OJiu1hfhxmjz+4O/wvMc6jYN5t1rSITQOzUo
 blWgeUJoqT9aczRvrY3jEW1K/uT5Xe0O9TzhqbaGg1bOUVSaI1DiTdFKBpbbWMz06z5X
 2+DA==
X-Gm-Message-State: AOAM5329up44CPP7+MtuDQ96AR8nCi1THITDQ7N8KTSmuxGYEGWxWqt3
 aPqLZjA58AEGqsv3Vnt1NeZ2e++jPjK6bZ/SLYl4Cg==
X-Google-Smtp-Source: ABdhPJwqACommhKnL7qSrJ6YAagLB0IEz2Ib+KMdLue5Akk8HtOkmOAXaz5YrH/P8tuhLsjVBcrMI1BMHIjw4rYj+eU=
X-Received: by 2002:a63:7d04:0:b0:378:fb34:5162 with SMTP id
 y4-20020a637d04000000b00378fb345162mr19713715pgc.487.1650986969341; Tue, 26
 Apr 2022 08:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220407054651.3924-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20220407054651.3924-1-Arunpravin.PaneerSelvam@amd.com>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Tue, 26 Apr 2022 16:29:17 +0100
Message-ID: <CAHbf0-H5uE4RtZwY0L8Wz0VG6QnU1+E3yhg3fDFVc3n__=nrNQ@mail.gmail.com>
Subject: Re: [PATCH v12] drm/amdgpu: add drm buddy support to amdgpu
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, matthew.auld@intel.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

I'm having issues with this patch on my PRIME system and vulkan workloads

https://gitlab.freedesktop.org/drm/amd/-/issues/1992

Is there any chance you could take a look?

Cheers

Mike
