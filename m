Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FAD65FCCC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 09:33:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8769B10E555;
	Fri,  6 Jan 2023 08:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B2C10E555
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 08:33:10 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso3026756wms.5
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 00:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jXfD5LYjkmB8Q/VcVaT2X+IYEgSjZ95FZeBe3MQlhuE=;
 b=mGV3OX8mKmvw38GBQf4i8UYr/BGTWduZrpbceHSDAv72HKRMJECmodxxq7/MggGlG1
 6TVVlfO8Tg1c7f9C0Gj9JUbzDMB4BhcoWQ3fKC4DN5rop5JbotoCvtNu1XXewJ4WCJRi
 bfk4ZZQcWgdElUROFSer6lfWMCBrxRoaLlX7VdKYpXIVIPbtM4A5bmvT7pYtqSnC1bx6
 ihbHrsHheoJkjLH0rFsYaHcBO2j7p5GsA86/8+9WLdCwk7G1I6LS9JT55OWdf8nl/Hf9
 /WB2ikUIYeKLFeG/1y3PqBvS8EWb0e/Gk5S/YNZu4/IgcMFoIZ7X+5ttdMecD6t5DWYO
 Vy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jXfD5LYjkmB8Q/VcVaT2X+IYEgSjZ95FZeBe3MQlhuE=;
 b=CTQwjExZRuRpcOjK5Zc9lMqbWIpLk1LcqyHEVZXyS3TYIYC1XDFBggeVPvId0db4y4
 Y+U93BD7wjD40lQp6cSSc6HA2iINnx8HCyE269IjKX0m8DmbMSTinA//DzL0zGbNiBv9
 kYDcDRett6UFp4Ve/pJ5SRBb/clDZ6F77WI7nGay8pUjmhQE+GDIMXUZxBBxIaCtL8u3
 wO7PY4WEf3srbCtP7vsSE3tOzyXosK8F5FRdTBXsPLVJgpoostuBmSyKq4XSekhF+6My
 J2VrQT1y5JkAKEEGiIHqL+JYXo+F+NUZDsjukyFXCR6t8geHYTGkzT1ZqmAS5CdIHf0d
 WbTA==
X-Gm-Message-State: AFqh2kobq9k7W7ZHOzTorjZThIqveBJ5b4jR3vKwLkn5+7ryH1+YLKio
 eGZgTTuodASauHCtCetbnOTH1dpFLNT/TA==
X-Google-Smtp-Source: AMrXdXvP85A0ZO3gnoVNQGbZj8lTDVas6vZWh+chzsOnf2A5ilLzf5tI67GNeVhYNreoz6v90ucesA==
X-Received: by 2002:a05:600c:4e13:b0:3c6:e63d:fcfc with SMTP id
 b19-20020a05600c4e1300b003c6e63dfcfcmr38408717wmq.35.1672993989357; 
 Fri, 06 Jan 2023 00:33:09 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 l21-20020a1c7915000000b003d9a3a0d461sm881031wme.4.2023.01.06.00.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 00:33:08 -0800 (PST)
Date: Fri, 6 Jan 2023 11:32:53 +0300
From: Dan Carpenter <error27@gmail.com>
To: fkassabri@habana.ai
Subject: [bug report] habanalabs: Timestamps buffers registration
Message-ID: <Y7fctbXR9oPd7K3J@kili>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello farah kassabri,

The patch 9158bf69e74f: "habanalabs: Timestamps buffers registration"
from Dec 23, 2021, leads to the following Smatch static checker
warning:

	drivers/accel/habanalabs/common/memory.c:2178 hl_ts_alloc_buf()
	warn: use 'gfp' here instead of GFP_XXX?

drivers/accel/habanalabs/common/memory.c
    2170 static int hl_ts_alloc_buf(struct hl_mmap_mem_buf *buf, gfp_t gfp, void *args)
                                                                       ^^^
"gfp" is never used.

    2171 {
    2172         struct hl_ts_buff *ts_buff = NULL;
    2173         u32 size, num_elements;
    2174         void *p;
    2175 
    2176         num_elements = *(u32 *)args;

This business of passing void pointers and pretending that
hl_cb_mmap_mem_alloc() and hl_ts_alloc_buf() are the same function is
a nightmare.

Create two ->alloc functions.  Split hl_mmap_mem_buf_alloc() into one
function that allocates idr stuff.  Create a function to free/remove the
idr stuff.  Create two new helper function that call the idr function
and then the appropriate alloc() function.

It will be much cleaner than using a void pointer.

    2177 
--> 2178         ts_buff = kzalloc(sizeof(*ts_buff), GFP_KERNEL);
                                                     ^^^^^^^^^^
Smatch is correct that it should be used here.

    2179         if (!ts_buff)
    2180                 return -ENOMEM;
    2181 
    2182         /* Allocate the user buffer */
    2183         size = num_elements * sizeof(u64);

Can this have an integer overflow on 32bit systems?

    2184         p = vmalloc_user(size);
    2185         if (!p)
    2186                 goto free_mem;
    2187 
    2188         ts_buff->user_buff_address = p;
    2189         buf->mappable_size = size;
    2190 
    2191         /* Allocate the internal kernel buffer */
    2192         size = num_elements * sizeof(struct hl_user_pending_interrupt);
    2193         p = vzalloc(size);
    2194         if (!p)
    2195                 goto free_user_buff;
    2196 
    2197         ts_buff->kernel_buff_address = p;
    2198         ts_buff->kernel_buff_size = size;
    2199 
    2200         buf->private = ts_buff;
    2201 
    2202         return 0;
    2203 
    2204 free_user_buff:
    2205         vfree(ts_buff->user_buff_address);
    2206 free_mem:
    2207         kfree(ts_buff);
    2208         return -ENOMEM;
    2209 }

regards,
dan carpenter
