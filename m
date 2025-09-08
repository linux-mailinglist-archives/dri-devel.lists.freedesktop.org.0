Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 425F2B48448
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 08:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E4610E002;
	Mon,  8 Sep 2025 06:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RziC8vx3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3963B10E002
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 06:40:42 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3dad6252eacso1711380f8f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Sep 2025 23:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757313641; x=1757918441; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UdIL7rYCYTWTeGzCXpS9pAZ9yVXKuO7dm+n3IlBpS68=;
 b=RziC8vx3PgrmiTlVbRealygzSU+VJDLsgarjl4eVvLfRmiWATxqC48aB3OhWQrO62E
 7AZBD7hRX6cGxbu2WvSIaCZq3V/1a4Qu3F4Mqi5flKs0tAjWOUSIA31GQyDVXf8f5KPk
 ekeaqI80a6/2VZeFawh8Tc6kizCVQYczTfikA2I8+rLnv8lNYfj0EC/MrcJBJ1r45ok2
 rMmYtwjLjYTqikaLwjA3sqtue4biHNYW6DqeEYI6ylDr+zcPFiraBaDi5z0xbV4zRn4x
 Z10YXdRYrifA3DTm6s/8Ctw1qyiWtIo9gnW2qSRhkIVt84HA+B/5pe6Tz9vX/h9Pjo0Y
 UbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757313641; x=1757918441;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UdIL7rYCYTWTeGzCXpS9pAZ9yVXKuO7dm+n3IlBpS68=;
 b=GewrMXk38TnwOv/LRkUV9KwWRVTklWFVlPUJio6/7eVTHZp38TyhS7OvYEoPlmO9+d
 N6ZRIO6yxsC56Q1hITfQ073WtHqM12uxeatngk6GM4SG0plT4MODq2d6TSD7J20Y4fAX
 thgVfAFzfKaTqJCyVniP77J+WPGtvgF/+nb2vyyNv7VDLC7WBx2sCmPMe86/QlfM042k
 S37DDKnY6G+V9PjkgH9+r5w2WfACIIKKu4PFh19yDGRr+wURlyesbTAFds8dtylTnBgr
 ml1hxN8BYlZO5sWmjsZSNEoVp9CfmaI0Uc/GbBr4T8a2Lj/p1guIuazscMiXaQtSntfC
 lDzw==
X-Gm-Message-State: AOJu0YyGgf7W7U304U4tJcgPeBTZn3JgdbfuTI7/faPydet3oA+zFvaR
 hTe7A85NXnP4NX1M5tG/TKmSlHhf5bMBJ2O2b4eJUQP1Ef5FXL/OLD62JWhFV1hoUc0=
X-Gm-Gg: ASbGncuCTKWaAfox7xtkYcUcW/NvUoEb64Xg+z/Fs9vk58kc8YkswaGz/qdCWjfotQj
 QcDnqlQjWs1jNgzvYbl1qSdDssMFw6Cwe+nhiOiQYGzG0xRubLqR+uggTgxoDnSAic48OkEI5ce
 N/QuzzYVKVl0G8rX7/F4+opfWcULN6ns2QHO5gHdGqwzhSMT8cmNmkSOxpizNtx98ZtHDSuQdTy
 +szX9Kj1aifLdKIuv8DDXeJTBOdU9KJRBdFxBnlvI2JGrrilNgkYnJ/4herTbDnlEwpzTzaxZqi
 nub4v6hq3vhyLThTIxi+v9gVWMeFoCZAjW7r6cpVX/ZIXy2rHJP1D5Rtm6oPBqQ/507Ek7PkMhn
 nw6hHAdCdKA4JfCLUE11h+p7IA/w=
X-Google-Smtp-Source: AGHT+IEBYFgldCyQHL3HLH6+eNP+raHLNIiWKGmmwb90V0L8EGPcPDZ9hGmfOTopqsgr8l2q8PWviw==
X-Received: by 2002:a05:6000:1ac6:b0:3df:f065:ca13 with SMTP id
 ffacd0b85a97d-3e64392b761mr4572167f8f.33.1757313640633; 
 Sun, 07 Sep 2025 23:40:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3d978ab6fc7sm25293815f8f.45.2025.09.07.23.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Sep 2025 23:40:40 -0700 (PDT)
Date: Mon, 8 Sep 2025 09:40:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] accel/amdxdna: Add ioctl DRM_IOCTL_AMDXDNA_GET_ARRAY
Message-ID: <aL56ZCLyl3tLQM1e@stanley.mountain>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Lizhi Hou,

Commit 2f509fe6a42c ("accel/amdxdna: Add ioctl
DRM_IOCTL_AMDXDNA_GET_ARRAY") from Sep 2, 2025 (linux-next), leads to
the following (UNPUBLISHED) Smatch static checker warning:

	drivers/accel/amdxdna/aie2_pci.c:904 aie2_query_ctx_status_array()
	warn: potential user controlled sizeof overflow
	'args->num_element * args->element_size' '1-u32max(user) * 1-u32max(user)'

drivers/accel/amdxdna/aie2_pci.c
    891 static int aie2_query_ctx_status_array(struct amdxdna_client *client,
    892                                        struct amdxdna_drm_get_array *args)
    893 {
    894         struct amdxdna_drm_get_array array_args;
    895         struct amdxdna_dev *xdna = client->xdna;
    896         struct amdxdna_client *tmp_client;
    897         int ret;
    898 
    899         drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
    900 
    901         array_args.element_size = min(args->element_size,
    902                                       sizeof(struct amdxdna_drm_hwctx_entry));

Instead of min() here we should just return -EINVAL if they are !=.


    903         array_args.buffer = args->buffer;
--> 904         array_args.num_element = args->num_element * args->element_size /
                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
These are both u32 values controlled by the user so this is an integer
overflow bug.  Security bug.

    905                                 array_args.element_size;
    906         list_for_each_entry(tmp_client, &xdna->client_list, node) {
    907                 ret = amdxdna_hwctx_walk(tmp_client, &array_args,
    908                                          aie2_hwctx_status_cb);
    909                 if (ret)
    910                         break;
    911         }
    912 
    913         args->element_size = array_args.element_size;
    914         args->num_element = (u32)((array_args.buffer - args->buffer) /
    915                                   args->element_size);
    916 
    917         return ret;
    918 }

regards,
dan carpenter
