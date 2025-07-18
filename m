Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D62EB0A095
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 12:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C5D910E943;
	Fri, 18 Jul 2025 10:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="H71nClKD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D2B410E943
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 10:26:56 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-7dd8773f9d9so180130285a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 03:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1752834415; x=1753439215;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Tceb6O3nBrebvy+ZDwLDwrGTRdGaZ8naYMQfV4XKrrU=;
 b=H71nClKDQgr2Oomm/gjBWWIIREqATZyMCEvisvZFsQyMBuCXdEIvK6ygJ8A+h7VwIU
 Da1RR3wqK/O+LE9Z8XcwqBB050c2njEQHSakqkOHBHiyRLL7WIIz2XdM2/qrgoDot7d9
 aNkTxTsy48mUmk+scyH0RYj117XkMaMMY0d7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752834415; x=1753439215;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tceb6O3nBrebvy+ZDwLDwrGTRdGaZ8naYMQfV4XKrrU=;
 b=cUsJS5g36n+SjNxsrGTKBx9QsBloyeLAOBG+Lwht1ne8/acIA3TAbL73o/8SCKj+xm
 YvPLAAMRHNyLYb7eLZEAc7UjoGmJa95y+ApyQY4hneZZWS09Wp9k2oKJgEsaAz1Qzx+I
 I1aJoaGXfRBayhK1GQcBOvwH47rRcOAGwYaNa3ek0fuxQBVQvKKAWBCxMxxlGDPyMggq
 vzvdXLDmq+PMS9nowljf21n4ChDNx8+iJ9j1LJKtLp399s79HYpTgOZm6we8HAheycSX
 jDbNwwU+svMV942CcB4fm3/LUp7RmX+r894Zdbk27qAhFQY17lzNIMy5DYsqsrk25jIx
 /xYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwbiUN4hPQW2P7UK+o2HhfaasYz33/yv33zNs+GRGlD24v62/a4QRuk7IjcXwLpHwfl16iiq+NUFY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMLlxCJ0BANX9xQ8yib+hgXvSnjOzAy8/4KRdB/S+V+6biwTuZ
 3Oiauhg4Uc/6Ha0mM80tgHUe2UbPKwUhi+i7v1bzj5VtNqQ8boHY/+RB0bRmRVdGSQ==
X-Gm-Gg: ASbGncto42FuW/UlY95ka+ULh73h44VfvlTK6TmAo/wVg/esSZOHmJfUCj4Rz2A8ut0
 SvuSc9kiH0SEcUHlfWGchIC7RBE4x1VqWbpmpMdpeM5/GXsMMvrTvAE3vzssVPqrCdvZ1uT6Kpn
 jpSR5wSVSYAGTV4DG7o90WWKLKNJSUC1cOsjuzTffmbF3kcfNPBEEYaebhMMPxv5F9JO4f+NHoC
 iQjUIe9S88vqHpuZZ1cu2WpZdREkek7b7kHAKWvWc+EHthq8S1y2JbZ89L8UMXq7o/apsGyH6Mr
 SxF+AWxfVDiOhaieukVAEzXYNvdVAswmVA8NPYXKy3tgsa0fV4r8UuoL9eiIP03V4kGq39g7QmF
 gd/98Ux8QoTeXFmMJ6NShW9Brme+NbtIjJnhZ25ixY/TG/XWUZDk=
X-Google-Smtp-Source: AGHT+IEqo4UAFanleVPdYl4dXVyU1lZnXf1z6whg+8xWt/p2QDWx5PJ8H+d/5db0hyJyi9WF5q8VPA==
X-Received: by 2002:a05:620a:19a5:b0:7e3:52f6:66e5 with SMTP id
 af79cd13be357-7e352f6672amr568859885a.35.1752834415217; 
 Fri, 18 Jul 2025 03:26:55 -0700 (PDT)
Received: from [10.229.41.1] ([192.19.176.250])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e356b46814sm68537885a.30.2025.07.18.03.26.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 03:26:54 -0700 (PDT)
Message-ID: <4445c7ec-a580-4c28-89cf-2df5790de6ac@broadcom.com>
Date: Fri, 18 Jul 2025 12:26:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] wifi: brcmfmac: Fix typo "notifer"
To: WangYuli <wangyuli@uniontech.com>
Cc: airlied@gmail.com, akpm@linux-foundation.org, alison.schofield@intel.com, 
 andrew+netdev@lunn.ch, andriy.shevchenko@linux.intel.com, bp@alien8.de,
 brcm80211-dev-list.pdl@broadcom.com, brcm80211@lists.linux.dev,
 colin.i.king@gmail.com, cvam0000@gmail.com, dan.j.williams@intel.com,
 dave.hansen@linux.intel.com, dave.jiang@intel.com, dave@stgolabs.net,
 davem@davemloft.net, dri-devel@lists.freedesktop.org, edumazet@google.com,
 gregkh@linuxfoundation.org, guanwentao@uniontech.com, hpa@zytor.com,
 ilpo.jarvinen@linux.intel.com, intel-xe@lists.freedesktop.org,
 ira.weiny@intel.com, j@jannau.net, jeff.johnson@oss.qualcomm.com,
 jgross@suse.com, jirislaby@kernel.org, johannes.berg@intel.com,
 jonathan.cameron@huawei.com, kuba@kernel.org, kvalo@kernel.org,
 kvm@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux@treblig.org, lucas.demarchi@intel.com,
 marcin.s.wojtas@gmail.com, ming.li@zohomail.com, mingo@kernel.org,
 mingo@redhat.com, netdev@vger.kernel.org, niecheng1@uniontech.com,
 oleksandr_tyshchenko@epam.com, pabeni@redhat.com, pbonzini@redhat.com,
 quic_ramess@quicinc.com, ragazenta@gmail.com, rodrigo.vivi@intel.com,
 seanjc@google.com, shenlichuan@vivo.com, simona@ffwll.ch,
 sstabellini@kernel.org, tglx@linutronix.de,
 thomas.hellstrom@linux.intel.com, vishal.l.verma@intel.com, x86@kernel.org,
 xen-devel@lists.xenproject.org, yujiaoliang@vivo.com, zhanjun@uniontech.com
References: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
 <F92035B0A9123150+20250715134407.540483-5-wangyuli@uniontech.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <F92035B0A9123150+20250715134407.540483-5-wangyuli@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 7/15/2025 3:44 PM, WangYuli wrote:
> There is a spelling mistake of 'notifer' in the comment which
> should be 'notifier'.
> 
> Link:https://lore.kernel.org/all/B3C019B63C93846F+20250715071245.398846-1- 
> wangyuli@uniontech.com/

I think it has been said on other patches but it is not common to link 
to obsolete version of the patch series. Apart from that:

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>> 
Signed-off-by: WangYuli<wangyuli@uniontech.com>
> ---
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

