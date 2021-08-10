Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 371AC3E7DE0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 18:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626B76E04A;
	Tue, 10 Aug 2021 16:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869F46E04A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 16:57:33 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id i4so9747954wru.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 09:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=73BGKMksZD5EdkYDuX0c4Ps+3ne/EsWj5bH4TPFGMWE=;
 b=h4ZnEu6Tnr04tPriYchuan9CV8BL/UJdsxr7RIhTLHfULWcROjn2OM2ZzpzeEKMm9h
 BDroCIyvdYkiZqLtxn6P2fzgNZ6VkggSSRzgk+P6CIRlF9As3AJaR1m6AmK91Ueabgzu
 XH08Kb2JNALpoEy5EUJHQ8/ksSGdMe97v0kiU0T9U/hK7AUcQy755OFRYKfNj8O1gVZz
 VkSJXaiGOD182vjFJtJKkx5ZeB7YvrFbdFOTLmvNWxZuVB2aNBwhsRbNaMcacckqK1eu
 q2o1fYncp8SMbZ7tzjebSl2fTB/HNapleDIeszyflr+mBNl3haZCI3i2D7j5LB3AosAJ
 4yfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:user-agent
 :mime-version:content-transfer-encoding;
 bh=73BGKMksZD5EdkYDuX0c4Ps+3ne/EsWj5bH4TPFGMWE=;
 b=Y78o5MVz/0R+6UXYt8mrzVMbjah5kQJC0+5MnbNuJTiJRxdgJVaFAx31mSPYaMDiS2
 hjszvQxpgsWDsh8VTLRQQxSzM9k+alNhz6nr9nz/Q3UM8yW8cIgvXwo2cx8rO3s9EHd4
 19epfF8DN08v1sOZFvFrYM1WQ8TwUjNLTOXZlDJRVIX6f7R0mdeL2avaDbft9mAE+5bs
 bXP3uiAhOfN0SJ3AnlqPc8DKyTGdbRUCNGGwPz3zJDxOvc6p8rcnF9J0wLs4hEqi/1qo
 VXno2d+4bKerNGvzOJZMVOLCo+33IL9+Kbt1fKaHXgUT+w6wNHCdX0sw1s1Tt/fvUMhn
 zj2A==
X-Gm-Message-State: AOAM531gKClfVmwdCq/VeMunO0PK1UazzlLKx0qWlJEtKVVevga9igI8
 4ZNS10bbY+x3uM8e8htV8dKvK7PjW4sYPAT5
X-Google-Smtp-Source: ABdhPJzllGF0LHEJxE4d24ZkyBVZas+ZtZ6amdHv6/I6eDBaUtkLPpudJ0TQZqXZ8dfZaPU57ptOYg==
X-Received: by 2002:adf:f406:: with SMTP id g6mr3288507wro.131.1628614652388; 
 Tue, 10 Aug 2021 09:57:32 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net
 (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
 by smtp.gmail.com with ESMTPSA id z137sm3400612wmc.14.2021.08.10.09.57.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Tue, 10 Aug 2021 09:57:31 -0700 (PDT)
From: John Cox <jc@kynesim.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: How to obtain a drm lease from X for overlay planes as well as a
 primary plane?
Date: Tue, 10 Aug 2021 17:57:31 +0100
Message-ID: <34a5hg1rb804h8d1471apktsgl5v9n9u1e@4ax.com>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
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

Hi all

I am on a Raspberry Pi, I want to display fullscreen video and have a
couple of overlay planes to display controls / subtitles etc. The h/w
can certainly do this.  I need to be able to do this from a starting
point where X is running.

I can successfully find X's output & crtc and grab that using
xcb_randr_create_lease and use that handle to display video. So far so
good.  But I also want to have overlay planes for subtitles etc.  The
handle I've got from the lease only seems to have a PRIMARY & a CURSOR
plane attached so I can't get anything there.

How should I be going about getting some more planes to use for
overlays? Pointers to documentation / examples gratefully received - so
far my google-foo has failed to find anything that works.

I'm sorry if this is the wrong place to ask, but if there is a better
place please say and I'll go there.

Many thanks

John Cox
