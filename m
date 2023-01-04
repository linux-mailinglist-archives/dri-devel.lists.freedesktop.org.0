Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCF365D446
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 14:32:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FBE410E1E7;
	Wed,  4 Jan 2023 13:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3006::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1528110E1E7
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 13:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202212;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IOSyy9qLnE23gYPkxy+Uq+fU0lOhXKd4jlSpT2dlU5A=; b=O+uu13MHgjvquntLx1syJgqHOC
 tmpzfh17d2gQLO8gwkzRIXpvHhnWUXBiMOySVGk87Cs21nrI0LT9qnGy94cmR9Zsn1cAAQUvKrNYm
 YnBwhZsHy0F7BP0EAdRYEI0lbWVJfgSOBNE4TwkO3tVf/skdSeFhuwSwfk4fCPkJPOvpleHXIk1sf
 P0lTi1AQdn+RyUjpdFuWWemUzr/WH1CwN4barmJfri/ZnPVElPiXybJ90jHeU9t44c/qCcz7I/0Nc
 v/lT0dray+ZZ6fmw44qs+SSMcUO6H4psGouO3PnvkEVnxGJnSzjPFpO8r/bvCLQCeHDfZjtvFpdPk
 h5z/7ywQ==;
Received: from [2a01:799:95e:b600:b244:dd1d:d193:f437] (port=51160)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1pD3sh-00BPi2-8O;
 Wed, 04 Jan 2023 14:32:36 +0100
Message-ID: <49575355-8572-500f-d66e-6f6497359e6a@tronnes.org>
Date: Wed, 4 Jan 2023 14:32:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/9] drm/gud: use new debugfs device-centered functions
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221226155029.244355-1-mcanal@igalia.com>
 <20221226155029.244355-3-mcanal@igalia.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221226155029.244355-3-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Tomi Valkeinen <tomba@kernel.org>, Emma Anholt <emma@anholt.net>,
 Alexey Brodkin <abrodkin@synopsys.com>, Liviu Dudau <liviu.dudau@arm.com>,
 etnaviv@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 David Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/26/22 16:50, Maíra Canal wrote:
> Replace the use of drm_debugfs_create_files() with the new
> drm_debugfs_add_file() function, which center the debugfs files
> management on the drm_device instead of drm_minor. Moreover, remove the
> debugfs_init hook and add the debugfs files directly on gud_probe(),
> before drm_dev_register().
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---

Acked-by: Noralf Trønnes <noralf@tronnes.org>
