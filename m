Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB06C82EC61
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 10:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47CC910E47C;
	Tue, 16 Jan 2024 09:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B0510E466;
 Tue, 16 Jan 2024 09:58:39 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-336788cb261so7954662f8f.3; 
 Tue, 16 Jan 2024 01:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705399057; x=1706003857; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2uhSmZfzoghRK17rw0hKmTfGn83P0SdA/F+Pbhd5eJg=;
 b=i3X3jdIsZJQuHEppdCCGwk1cMB4sA/tewsZ/MsJItEr82GVF+v0eJ4YKzvkckWKJz9
 dwS/phAJpLe7RrhHHKFGCOu/3LsnfNap3jlahFPAEGI6ywp6Kkxoq2acrkSoz6BxquiX
 Gg8hU4Cd+jGbZ8q1iAlgB+M/S8PjsjcbyrY89ku5SsVk1bHWAu5A5PnRmJ9bf4+5aj9W
 aeEAbGfSTM19G0g7r1+PFWdbEpksA3ss5TgP9jnn/KKSluMgE5MOS34tQi7Q2EsE3N2C
 jlEn0C5edeJAB4JbMFqza1itgavAGG0hMigXptmnhqO9OGucT2YopVDEStHT1cy3qjYo
 SmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705399057; x=1706003857;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2uhSmZfzoghRK17rw0hKmTfGn83P0SdA/F+Pbhd5eJg=;
 b=IaEL7wqRxXrF3igdj035/6uBDjzQ5inDDzCssHnezYyVm1e65iHBi0QSUwByS6/fHG
 ERnZPuRFyi40lvJLaLWbL9RX6Mf645rAEA1t8sAEyU5/vnlLdtGKik/nnjomiqaFQ7CZ
 +0OdgEy0Y2PrqLY96Q1+7Mmyaw8JGe7PRVdjIbNK2dezri3Crf6J0oDM7BHZA4aG1pPu
 wBneCsWNrxiJXkgquiQ6gNLenkWFiV61Dgkyb7feYRc4VQF1AJDYjCMsl5HX73EGNbXC
 7zRmX8aMQDVgWHWZyzuHn1ATiiBejYdhoiOqi2DkNNrgLb2Rh7kOyQLUhCW+dxrzJV+B
 c9Hg==
X-Gm-Message-State: AOJu0Yz0I6XA4sl1gGQimtie5PYxTmcafaunNJj5Y1CnBKKiR5PHjQAz
 SVrpFtotcGzAMptDInty3PZ1iJECnmLbhA==
X-Google-Smtp-Source: AGHT+IEVFT0/1a9jbf1C6BJql5mBWfujuok+Gab1fp8jHloRHQYD+bvxhtShawLVKCV4fke/i/+2ew==
X-Received: by 2002:adf:ce12:0:b0:337:7b14:d9fc with SMTP id
 p18-20020adfce12000000b003377b14d9fcmr4320500wrn.12.1705399057320; 
 Tue, 16 Jan 2024 01:57:37 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 f3-20020adff983000000b00337bc2176f6sm974007wrr.81.2024.01.16.01.57.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jan 2024 01:57:36 -0800 (PST)
Message-ID: <1df3cfff-50af-4873-b228-57b6900b9ba8@gmail.com>
Date: Tue, 16 Jan 2024 10:57:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Rework TTMs busy handling
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 thomas.hellstrom@linux.intel.com, nouveau@lists.freedesktop.org,
 jani.nikula@linux.intel.com, kherbst@redhat.com, lyude@redhat.com,
 zackr@vmware.com, michel.daenzer@mailbox.org
References: <20240112125158.2748-1-christian.koenig@amd.com>
In-Reply-To: <20240112125158.2748-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.01.24 um 13:51 schrieb Christian König:
> Hi guys,

just a gentle ping on this.

Zack any more comments for the VMWGFX parts?

Thanks,
Christian.

>
> same as the last time. Things I've changed:
>
> Implemented the requirements from Zack to correctly fill in the busy
> placements for VMWGFX.
>
> Renamed the placement flags to desired and fallback as suggested by
> Michel.
>
> Rebased on drm-tip instead of drm-misc-next and fixed XE as well.
>
> Please review and comment,
> Christian.
>
>

