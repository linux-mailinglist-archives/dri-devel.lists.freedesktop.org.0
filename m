Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2733A4970EB
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jan 2022 11:27:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E880410E253;
	Sun, 23 Jan 2022 10:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD8210E253
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 10:27:13 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id b14so1656005ljb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 02:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hG3MFi9d2+wgL2UMIOE0RFDN8h1jJ7iyLBsfVPsxIwM=;
 b=q5CGDx8TPG4IB4TXu7FVsbbicuzX4Igme+coKrUa7lL0XcWBwN7HkfdMp92LShOOog
 1lVEarrBNKK+Dc5fxLbfQUsgX6wTaF2vfThpBiXoRiEqPlcpYRVQa/4KjBlsogFum9I8
 3Adq/JNsoEv5wzs8NTmDZS6KiBd5J9xOCj2OrIPRVoxLw/3W+K3NFqEQsLIUaf+CoeZY
 6jFWvQDZWfql7uyL2RwPqi1HEeOc/s7tYa04IsrOLipRITe/dykUqwRpnotlkfp2hT9u
 eOdph47bUvQL/GNg+tVvUEQP4/LButrBNWSeueIDoqlTeEI9BRnaZgjg5xnDi/8AZGTT
 4l0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hG3MFi9d2+wgL2UMIOE0RFDN8h1jJ7iyLBsfVPsxIwM=;
 b=wUZnwycmfDRV0hSXGs8YCsQBTSQlC8/5WrxZbWlcneKZ2M+R3wRkbTVnW4DQHYauml
 J1ob9dexPs4e/IqUwQSuzgtqBiKH8K+qHBcpwf3lzxI9ptbnkKZlaOfGc2o0Okx25nlw
 /tbC7ZY79jJUmEZnnsmmq4jB1FIOA8gbBVZby0CAV0ryKUI/csspdJOcLt157lO0Xajb
 lI1PbimTUnZ0iSwqSNTTtd/5aTgVQkVNqfcfKlPwkDjwSAYAyP9oXQIrQy5DEasYAZ6u
 md4bRiH5Kopd1cV26qpQDyHcYKiUGVThF52pRfpt6Sz4CiR7j1NBMRz7Zj7kR4vpgLIW
 hfcA==
X-Gm-Message-State: AOAM530vJyYsPpTFt/DrRoMTtIRCwIOn8T2ploOled06zyL26U4jJ6T3
 pugyuFdcAZNzc/hyjye9mNctb+uS4Hvjgmhbl+M=
X-Google-Smtp-Source: ABdhPJxx7WuD70Cgo7f+2TyArixIaVL89SlTzQZJBiCfBGsVR5NASARdVfaXTsKswAa7saNqUMRw602A3eLnN8Qg4Ak=
X-Received: by 2002:a2e:7205:: with SMTP id n5mr3743699ljc.361.1642933631506; 
 Sun, 23 Jan 2022 02:27:11 -0800 (PST)
MIME-Version: 1.0
References: <20211213184706.5776-1-philipp.zabel@gmail.com>
 <20211228101051.317989-1-jani.nikula@intel.com>
In-Reply-To: <20211228101051.317989-1-jani.nikula@intel.com>
From: Philipp Zabel <philipp.zabel@gmail.com>
Date: Sun, 23 Jan 2022 11:27:00 +0100
Message-ID: <CA+gwMccjh79W5RPGrwaAjxDDaANqgD8O7OVCDSPCYrKwgdYbaA@mail.gmail.com>
Subject: Re: [PATCH] drm/edid: improve non-desktop quirk logging
To: Jani Nikula <jani.nikula@intel.com>
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
Cc: Jakob Bornecrantz <jakob@collabora.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 28, 2021 at 11:10 AM Jani Nikula <jani.nikula@intel.com> wrote:
>
> Improve non-desktop quirk logging if the EDID indicates non-desktop. If
> both are set, note about redundant quirk. If there's no quirk but the
> EDID indicates non-desktop, don't log non-desktop is set to 0.
>
> Cc: Philipp Zabel <philipp.zabel@gmail.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Thank you,

Reviewed-by: Philipp Zabel <philipp.zabel@gmail.com>
Tested-by: Philipp Zabel <philipp.zabel@gmail.com>

regards
Philipp
