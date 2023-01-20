Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622C0675C8F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 19:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E11310E043;
	Fri, 20 Jan 2023 18:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9431310E113;
 Fri, 20 Jan 2023 18:18:09 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 g2-20020a9d6b02000000b006864bf5e658so3571452otp.1; 
 Fri, 20 Jan 2023 10:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=XQ4uabPFxcoQm1QTLFZD9BxVTRSKlhmuv6WCzUO6WaQ=;
 b=KMgDLS5757jbjzGjW899tT1tEBToRQRfHS8FCCqYX35R51Vj5737iTqoTi5Y2+o1K6
 ndv6/srqmAxKqD6UcsrWuBXf6IYewI0MF9ZGp6df5ELtjmFL/lTjTMIDkUbzwQISeFaK
 1PAs3embRd6Aktss63+0pTdEyplMeh9rcnx3Ctgo9SbCowVOFiqbB9i8VrjXZXTUibMs
 FpE+N8O7+kH958x6b2KNDM5UQ57AgyE9Rka+XU0RLvXheJAE4Fccw4njD2SH58IBR6no
 X4PsdKpqlwr6bIQeNe/h0Ssfa4HKenV9Z0lN9cT7yE9dA5v9aWuXCJqlZYSeWAMEdmOm
 AQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XQ4uabPFxcoQm1QTLFZD9BxVTRSKlhmuv6WCzUO6WaQ=;
 b=kAiy909lb0idDvHxTyc32FXgGC66/BLzoP5LN/ZWCkbYHzCJKYosrTnoTEMHuQ3QDf
 oTbBrIZ1hzYOugvEoLjknND4IaxM1yEBAjO0p5P/zoeDjD9TBW8MLYkDqlzVbMNa7Pfw
 CWMDefCyz/xszdukRImZvJe624DVLKHy5n8C876zf8Z0SxAxoIWztdolWJwu+d1MM04E
 ngbP6ZQiHatlPLlSujVOGL+bsaBuhUehScGahWG+qcP5X1LM9XIQ5+Jdv8+H1VS5nGy0
 4WR6XT7PHWIuroocoswDUYxBoW2s3epEFVhxP7d+YkyIbljyC0B2u+qPpCw4ZfAwojpi
 OcLw==
X-Gm-Message-State: AFqh2kql6rTmaYnZwXo0UMu1LJEKgwRpkK1NzP9TP0v4cL2EEqEQMIcz
 FTS69lUdvCPkkldGQO5UcpA=
X-Google-Smtp-Source: AMrXdXsRnYOtUAPLd55wUUUEzCAvNlj2J1+9X/g4Au5NCgrkEzwn9lHPX0+ZqJIsgGSQU/iwvc83oA==
X-Received: by 2002:a05:6830:169a:b0:684:e848:4593 with SMTP id
 k26-20020a056830169a00b00684e8484593mr7809357otr.32.1674238688753; 
 Fri, 20 Jan 2023 10:18:08 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 cp17-20020a056830661100b00670763270fcsm21773109otb.71.2023.01.20.10.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 10:18:08 -0800 (PST)
Date: Fri, 20 Jan 2023 10:18:06 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: "Limonciello, Mario" <mario.limonciello@amd.com>
Subject: Re: [PATCH] Revert "drm/display/dp_mst: Move all payload info into
 the atomic state"
Message-ID: <20230120181806.GA890663@roeck-us.net>
References: <20230112085044.1706379-1-Wayne.Lin@amd.com>
 <20230120174634.GA889896@roeck-us.net>
 <a9deecb3-5955-ee4e-c76f-2654ee9f1a92@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9deecb3-5955-ee4e-c76f-2654ee9f1a92@amd.com>
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
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 stanislav.lisovskiy@intel.com, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 amd-gfx@lists.freedesktop.org, Wayne Lin <Wayne.Lin@amd.com>,
 bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mario,

On Fri, Jan 20, 2023 at 11:51:04AM -0600, Limonciello, Mario wrote:
> On 1/20/2023 11:46, Guenter Roeck wrote:
> > On Thu, Jan 12, 2023 at 04:50:44PM +0800, Wayne Lin wrote:
> > > This reverts commit 4d07b0bc403403438d9cf88450506240c5faf92f.
> > > 
> > > [Why]
> > > Changes cause regression on amdgpu mst.
> > > E.g.
> > > In fill_dc_mst_payload_table_from_drm(), amdgpu expects to add/remove payload
> > > one by one and call fill_dc_mst_payload_table_from_drm() to update the HW
> > > maintained payload table. But previous change tries to go through all the
> > > payloads in mst_state and update amdpug hw maintained table in once everytime
> > > driver only tries to add/remove a specific payload stream only. The newly
> > > design idea conflicts with the implementation in amdgpu nowadays.
> > > 
> > > [How]
> > > Revert this patch first. After addressing all regression problems caused by
> > > this previous patch, will add it back and adjust it.
> > 
> > Has there been any progress on this revert, or on fixing the underlying
> > problem ?
> > 
> > Thanks,
> > Guenter
> 
> Hi Guenter,
> 
> Wayne is OOO for CNY, but let me update you.
> 
> Harry has sent out this series which is a collection of proper fixes.
> https://patchwork.freedesktop.org/series/113125/
> 
> Once that's reviewed and accepted, 4 of them are applicable for 6.1.

Thanks a lot for the update. There is talk about abandoning v6.1.y as
LTS candidate, in large part due to this problem, so it would be great
to get the problem fixed before that happens.

Thanks,
Guenter
