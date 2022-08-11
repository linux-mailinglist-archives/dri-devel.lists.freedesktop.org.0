Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D6D59056A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 19:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A6C18AA7B;
	Thu, 11 Aug 2022 17:11:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA0411AE8C;
 Thu, 11 Aug 2022 17:11:00 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 l4-20020a1ced04000000b003a5c761aeebso5456wmh.1; 
 Thu, 11 Aug 2022 10:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc; bh=9lmCRb9w6uCDtNqUvz+VlG2tKHmhpYW/JN7ZTZ0wmWA=;
 b=HueoZjS09HesHA6TCTd0JPvcBzWU0gb3xP9VW8Z/5Z/IKUTGcxCTFMAG6sdNrMVRPI
 XnrC4DiqsP2rdQJP9mkDCIzGrBusm9Qc0UUy6mvDQvs1Y9D/odTmBhoAqjwVVT1PEP2a
 JhvZLP7Y7ewJiwBLh9bNypUzht0ngPd3zFtQ3sgGLWOI4mqyM3Tb8e7fp8v1GuUb8mnW
 BsIZT+UyxiocbCaiSIIB9NZf9tSMHiXuJipn0qbdhRIgFIWA+K/RWq1NdWpHZCzcCc+J
 J1DEAaHrNGdyKVd4wCP6/y4ZMEMKdBfjcDWQwdB+WVDIpg0wcevdm6XgmJVtTgxQMo0t
 WLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=9lmCRb9w6uCDtNqUvz+VlG2tKHmhpYW/JN7ZTZ0wmWA=;
 b=L8lHLrnEaKtRKG6Gtb+4YOccmOf5zMHzcYm6emB8V/BZkw+MgqWEMAsuEx4M3k4xWI
 vso32lHvO7+mO2upoFD3oMMaUL9J6J8dIrn7305zw2Kewp/I3ChP3BPnvOHOCEl9lUHz
 /Pnl0l+TBEmfDIwE4Y6aqhc/w4nALdKxkLLXz4awxZysfz/6gNGOPVhQ77X5c2RTsIpm
 cja2/D3P66Pz928A8EC/qnpFQEVMQoB1QhIsrPhswZddDMwLXAws+ngit73ITD7j4PFi
 eDwXaLoPD8Vt+yQft825RWHnRUfFRotnfW1gfiYTyG32R0PMpOYk9xPFY185kaUnloaR
 Yz2g==
X-Gm-Message-State: ACgBeo3JVnZxudIPTxmjDmBKx0Ki8f8VDrZmi9rdHsxePgtDEuAH51bF
 /hZL7iyQWQXHq68YG012oRI=
X-Google-Smtp-Source: AA6agR68hJQ2kVu941cLF0W2MeedTSh595znTTi1zvBbU1seBZqoyPGDGJiGim5IewA7q2JgPbE7ew==
X-Received: by 2002:a05:600c:4ed0:b0:3a3:3ef3:c8d1 with SMTP id
 g16-20020a05600c4ed000b003a33ef3c8d1mr6369177wmq.154.1660237859175; 
 Thu, 11 Aug 2022 10:10:59 -0700 (PDT)
Received: from debian ([2405:201:8005:8149:e5c9:c0ac:4d82:e94b])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a05600c3b1b00b003a308e9a192sm7647413wms.30.2022.08.11.10.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 10:10:58 -0700 (PDT)
Date: Thu, 11 Aug 2022 18:10:48 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>
Subject: build failure of next-20220811 due to b1a63a0b48ad
 ("drm/amd/display: consider DSC pass-through during mode validation")
Message-ID: <YvU4GD8HtZ1A4dhI@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-next@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Not sure if it has been reported, builds of riscv, alpha, s390, arm,
arm64, xtensa, mips, csky allmodconfig have failed to build next-20220811
with the error:

ERROR: modpost: "dc_dsc_compute_bandwidth_range" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "dc_dsc_get_policy_for_timing" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!

git bisect pointed to b1a63a0b48ad ("drm/amd/display: consider DSC pass-through during mode validation")
And, reverting that commit has fixed the build failure.

I will be happy to test any patch or provide any extra log if needed.


--
Regards
Sudip
