Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1477A675BE8
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 18:46:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4834210E02F;
	Fri, 20 Jan 2023 17:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F7210E02F;
 Fri, 20 Jan 2023 17:46:38 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-15f83e0fc63so6989993fac.11; 
 Fri, 20 Jan 2023 09:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=hUvUA2IIr3qtMnOvBvL5zQt24HHkmc2C85O4j7dXdfU=;
 b=i3bO+kPprrkq3bNt7btyN6LWwl4miHQ7RE8ySv8ircxiwhR7SB2yHxjuyS9/VgUp9H
 NvRVDLhgOcUZivlnJE5bZkekhw3Ye4ajaNqbuKh0d3oyd1kmPWUpAFlSIZfjYEuvJAxt
 FLcb5wIc/evmZOhM4yH4gCoWbOhV/9Zz3wz3qB2d4uxw8sWr6mjXwoXzLguXJ1cmIkhU
 pcMuXKqi8tn+wn0eUMuhQi/t5F/Km/mO6xp2vwSVOTeDafxJokeSiNyP9brfqfY5b19t
 nUmw+HhZg+uC8Y3jYHwxmDQMRW4egVvoPAFPsPCJQhlRODFcVh+yTQrffuuR5aH1wN60
 /nRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hUvUA2IIr3qtMnOvBvL5zQt24HHkmc2C85O4j7dXdfU=;
 b=iYGmQfjdrbTu+ccrMMmJYbPs9s4/bIcAlix27oarqDpN3kEAt/ReCGIfNI+Xcdr6Qj
 NOkYSjaUiOgvcZ09nCpQRBMNK6lRsV+efwi0bPFYY18XLzTXLeBKwsn7tzj3MPhVqlMM
 +c5zhGHIDzTCdFpEEbJTHkjMoZrB+7lBtmghy6Q3OvskAhH/tB/3zRkQ7N7RmxUkQw2X
 6sIYz/tCFS6ZNAhPxW2uMDOh4zkAwwtCF4EN/MNw+vzAc/V+jNeAoEIz/C9/+jdrojL/
 WdFZsZJWi0w7txGfiPY8lDuQvACssOWGL52xLR/cFPS20dV6s15EbzrpQ6LqCVrgnMXw
 wXDA==
X-Gm-Message-State: AFqh2koYES/nnMx4pCsIvAmXV3Jn3U9yyqo+sE3ikcZQPcnL8w9p7foA
 42G3oFfL9vdnmScYEj16Ig8=
X-Google-Smtp-Source: AMrXdXs3gWMMWtehBRolAqaRrPB1xApkqkraSR4LaVvXxomzpHUftM+HKwaGNiCVay5j9fehIgQsPA==
X-Received: by 2002:a05:6870:c20b:b0:15f:1bd4:6f67 with SMTP id
 z11-20020a056870c20b00b0015f1bd46f67mr9524957oae.29.1674236797477; 
 Fri, 20 Jan 2023 09:46:37 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 o41-20020a056870912900b0015f9cc16ef7sm3513480oae.46.2023.01.20.09.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 09:46:36 -0800 (PST)
Date: Fri, 20 Jan 2023 09:46:34 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wayne Lin <Wayne.Lin@amd.com>
Subject: Re: [PATCH] Revert "drm/display/dp_mst: Move all payload info into
 the atomic state"
Message-ID: <20230120174634.GA889896@roeck-us.net>
References: <20230112085044.1706379-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112085044.1706379-1-Wayne.Lin@amd.com>
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
 stanislav.lisovskiy@intel.com, bskeggs@redhat.com,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, amd-gfx@lists.freedesktop.org,
 mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 12, 2023 at 04:50:44PM +0800, Wayne Lin wrote:
> This reverts commit 4d07b0bc403403438d9cf88450506240c5faf92f.
> 
> [Why]
> Changes cause regression on amdgpu mst.
> E.g.
> In fill_dc_mst_payload_table_from_drm(), amdgpu expects to add/remove payload
> one by one and call fill_dc_mst_payload_table_from_drm() to update the HW
> maintained payload table. But previous change tries to go through all the
> payloads in mst_state and update amdpug hw maintained table in once everytime
> driver only tries to add/remove a specific payload stream only. The newly
> design idea conflicts with the implementation in amdgpu nowadays.
> 
> [How]
> Revert this patch first. After addressing all regression problems caused by
> this previous patch, will add it back and adjust it.

Has there been any progress on this revert, or on fixing the underlying
problem ?

Thanks,
Guenter
