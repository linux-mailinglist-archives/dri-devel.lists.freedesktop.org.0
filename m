Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 821EC138674
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2020 13:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5B36E511;
	Sun, 12 Jan 2020 12:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CFE6E4C9
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2020 11:08:25 +0000 (UTC)
Received: by mail-vk1-xa2f.google.com with SMTP id i4so1803073vkc.3
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2020 03:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=5NGULq227EfAjb1RtbeUQW3o0TOWy0BMMqMukXMcWtM=;
 b=W5Ed5uQH4RGP2sWCWnwJymBhN14fe8TFNcdmcwxhO8vBCFpGBMa3qylxYQP2dJXjLf
 02AkHAQR53rjO6nH7hzrnE/sBx8eRbfn6BMuZY9V5Wl4vxxB3M/NOO5V4N5E/puoyD+V
 ZRPRiOkOIwrwnPhygjBoFB3ij/3JT+jnpNqXBTf/7nfTs7xyDWvcMRAYGhNErc2cXcNm
 NwbiisQ8tw5T6JEh77ZDezhGN69hr/ufNaUfqCNDPV5xjhkfkVcwWTvdE8eo0B+xXVdP
 FJC0Aj/ntho8UkzOA91gUez6lu1lDDyLV2xJMRjNMawB1Rm7Kw6mm/dvH7SjCm+Pts8F
 JaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5NGULq227EfAjb1RtbeUQW3o0TOWy0BMMqMukXMcWtM=;
 b=VSwMiA6/WD945InWUe1ijjQbq8MtXP8HZ1BsBKRnqvHxMBcC/DPyS/aUqN1HfJMHDV
 ejc/ih/GjMQ4tcUubVMufV30ezfc3/uiBxecSD5686DNmKEdkNwl5rvIuTq3M/WW26nG
 9tMuDGxrLxdv2Vpn6qfdZUwFcy2CshLoFsDQcpclTOeqH7KaP/N7Zzd0bJpCy8//+HT9
 RxL4g5e9sYVMybHe3R1NfBHFaOD3a4pIzyHLVyUBWpAVyKftbVr6bJBPGeuUmKs3Yzdn
 5EO8d6i1JhVALsGV2yEWoFbaqXlgtNyghqXe1u4vyCuY2bIEMvRml5bb2HU/6QF4QIaV
 xZMw==
X-Gm-Message-State: APjAAAVT7lZhf5Phscx1JQGtycKRQx6xr8nBUirV0B5azW5SQdE2TMEd
 E+P5ix2YCUFyF3dJ2209elFpKF2ORW3AUzHuB266zITP
X-Google-Smtp-Source: APXvYqyjJBJiHmfgo0OnsK9Zc8GrNerzwaVn9CJlNLxSMI9cgbnowZALq85Pq0NaLIqsXYxQ+oOCKtK/SKyF7cb0ojI=
X-Received: by 2002:ac5:c15a:: with SMTP id e26mr7460529vkk.62.1578827304751; 
 Sun, 12 Jan 2020 03:08:24 -0800 (PST)
MIME-Version: 1.0
From: Patrick Bourgeois <patrickbourg70@gmail.com>
Date: Sun, 12 Jan 2020 05:08:05 -0600
Message-ID: <CAHDRyzpHUGMGTLYZQGM8rnY2dRQFNkZ72=5h9aL5SZKwzUAcNw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] drm/tidss: New driver for TI Keystone platform
 Display SubSystem
To: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Sun, 12 Jan 2020 12:36:09 +0000
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
Content-Type: multipart/mixed; boundary="===============0891375872=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0891375872==
Content-Type: multipart/alternative; boundary="000000000000a9548a059bef6010"

--000000000000a9548a059bef6010
Content-Type: text/plain; charset="UTF-8"



--000000000000a9548a059bef6010
Content-Type: text/html; charset="UTF-8"

<div dir="auto"></div>

--000000000000a9548a059bef6010--

--===============0891375872==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0891375872==--
