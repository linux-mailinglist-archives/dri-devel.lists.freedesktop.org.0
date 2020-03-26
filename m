Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D7C1943F0
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 17:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986226E332;
	Thu, 26 Mar 2020 16:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9EB56E332
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 16:03:19 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id h15so8438176wrx.9
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 09:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PuNByyv3siGkvbhEPycVCa/IKpHpjzZf/6rC1PXvGxA=;
 b=Zl5mMF/H1oqVlonG48JjLmrvN45dZOEwKZ01kOHvwsp/yg33B0FUmVnoNLfJXM25qJ
 wld3dnY6W3aTGLDFJl5pixXabyDddwsdLYl+jGK41vBDqdK0CVpocHANQJYtfeNMjn/c
 bKwt54lFgo7UuXf1TeFA0HC139CArdNXqlLd/gY+j724Bal5tBefdTFZ8lzAhJb+2Kkp
 Ox0KU2Z4CeFjzVcKvWTpub89N7gsZ4TGGeZbBZDZVvLDf0g0UBOJauNuKxtSBfHe43/L
 EW+2AIYeFrBzQnoLgo5rwOCXknuTPtDGI2Mss0q9HQlNra1VdgWlb5GcEwQh7abd9Lkb
 3wkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PuNByyv3siGkvbhEPycVCa/IKpHpjzZf/6rC1PXvGxA=;
 b=KARFCL9MptNux0DssGp203Rpcnw4TJdUWLHuc9b3IBYW2SalbxeyVk3Uz9/k5maFSc
 Ru3DjTxAXE9C9qFb8XrSkOgWdv4RkSPykrI1uKteGlaaTO8H/W5vfuhD2evwWMNRQAqp
 bkU13PcNMad/jvy2K0XbLoT7mbi3wp5IZXsl0oh40ijwe2Qbtw/WQSg3cKLOFtuE9QGy
 o577bGHyW3P2GSmtC1U3QdsMqxaBOkUAIr+BnbLkN1ax9VSkZJqtEj8hBti8o3N2+6U2
 57GsXiLV4i3mywHLbDxD5t9YKEeQEia12PaySv0eDcUanL/mppDzj5Tplf8tXoSeuRAJ
 tSPw==
X-Gm-Message-State: ANhLgQ2fzmfGTQJkAxsR2lBv43tKyVQ5qSTo+cijd37Lv/iSs77RnAy/
 slZ/aHJUyHK37ptfiVD1A5A=
X-Google-Smtp-Source: ADFU+vst6w9oQGmN5Epfx6vNxd+NzIylAwdJtZNvAk9/eq53r+Xok4rbrZH9juCGZr/2xuU+dI09Lg==
X-Received: by 2002:adf:b3d4:: with SMTP id x20mr9851913wrd.269.1585238598438; 
 Thu, 26 Mar 2020 09:03:18 -0700 (PDT)
Received: from [192.168.1.125] (46-126-183-173.dynamic.hispeed.ch.
 [46.126.183.173])
 by smtp.gmail.com with ESMTPSA id h5sm4116253wro.83.2020.03.26.09.03.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2020 09:03:17 -0700 (PDT)
Subject: Re: [PATCH][next] drm/vmwgfx: fix spelling mistake "Cound" -> "Could"
To: Colin King <colin.king@canonical.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20200326101911.241233-1-colin.king@canonical.com>
From: Roland Scheidegger <rscheidegger.oss@gmail.com>
Message-ID: <d9ee5ec4-7341-decd-a382-3004fd367beb@gmail.com>
Date: Thu, 26 Mar 2020 17:03:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20200326101911.241233-1-colin.king@canonical.com>
Content-Language: de-DE
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 26.03.20 um 11:19 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a DRM_ERROR error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> index 367d5b87ee6a..2e61a4ecd8ef 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -3037,7 +3037,7 @@ static int vmw_cmd_dx_bind_streamoutput(struct vmw_private *dev_priv,
>  	res = vmw_dx_streamoutput_lookup(vmw_context_res_man(ctx_node->ctx),
>  					 cmd->body.soid);
>  	if (IS_ERR(res)) {
> -		DRM_ERROR("Cound not find streamoutput to bind.\n");
> +		DRM_ERROR("Could not find streamoutput to bind.\n");
>  		return PTR_ERR(res);
>  	}
>  
> 

Reviewed-by: Roland Scheidegger <sroland@vmware.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
