Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EC441E87E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 09:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBEB6ED10;
	Fri,  1 Oct 2021 07:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16376ED0B;
 Fri,  1 Oct 2021 07:39:32 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id m22so8531796wrb.0;
 Fri, 01 Oct 2021 00:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=Vmi8oK1Qmx/6rRQluF++rvOQQfA35Z8+nafl9mGZxoM=;
 b=GGBuLTZfsx9e0Z3PrzAV/DhCNs+0P9yszvgxjEU86qKmu25Y8apQeeCji2gZ3GjqiF
 xEOzDP2BbDzJPquEHZp4E1EODKw/Zkn0JxiRj6U4V5NIdEDaHLfaklauZ+gaS7fBuD0Q
 PuNEzANsY5/QjgGHfhA7uOlPoI/I2V/VKbfsDFgM2SkOr/eXdIHiyVW2SeGIRRzQKEQ3
 26qmKQP9GFFNMGv2/+qIY5ws3fzUJX3S3KCYNnm5sHR/hy8FbhSR4Ijsb3DhT9rGNKdo
 j0lGduj3QZ3ffKP0riGNPgYmI7ATkQ/7VfpCL2tezw0dChJi+2J+UHw4yKD64qMtzRDI
 TzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=Vmi8oK1Qmx/6rRQluF++rvOQQfA35Z8+nafl9mGZxoM=;
 b=rGWZwBUxln6IJwo4/AYzvOlLvUPEPYAyzjNarBgFEFyfa7T86IBIg0RH4BGFtapn/+
 5PRC3LZN3N5KKr8E6F/ssePOQVihsB0EelyB7PMC8QQiIPi2gsP54pGUsXWYbvpd7gan
 i1IJuO1i/yHpt23vAJTuTaiA7NQIs8JeQ9Ccy/+V1BOqTNJfpEataHqIElr3uvZy5y+M
 KRNcbftGtDt53YW5iZnZ0YLfFD3A01ZTxbmbChnhEN8+1sKP/ZHCj997OkEHQMC8snw6
 gQASs51InjwG8xt8Q6HD0iizEyjlkyHh+N0PLiFWI2mNDAav6/VnPf0Z7DzZoUPA1ZIw
 4Xxg==
X-Gm-Message-State: AOAM532AjY1AHnK3AuD3/C/imcpHgDNUSBAZz8qaozdIZFXVFDuMWKhv
 nl4TeY9G7aIqmoYqjXUdoYY=
X-Google-Smtp-Source: ABdhPJxutc0FgITc15folp+ioGAI6qjvXej2SIGY8JPVpqzINwlypwpCrvHigqfAte48su/uYd/d+g==
X-Received: by 2002:a05:6000:550:: with SMTP id
 b16mr10876188wrf.297.1633073970911; 
 Fri, 01 Oct 2021 00:39:30 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id c132sm7021813wma.22.2021.10.01.00.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 00:39:30 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: fix some repeated includings
To: =?UTF-8?B?6YOt5q2j5aWO?= <guozhengkui@vivo.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Simon Ser <contact@emersion.fr>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, "Chen, Guchun" <Guchun.Chen@amd.com>,
 "Zhou, Peng Ju" <PengJu.Zhou@amd.com>, "Zhang, Bokun" <Bokun.Zhang@amd.com>,
 "Gao, Likun" <Likun.Gao@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 kernel <kernel@vivo.com>
References: <20210930094239.7435-1-guozhengkui@vivo.com>
 <AGiYadRf5XyGUqLxwu3ykKzfwM2BgZo4yCAaEXdQiYfH2dbyKmipDNrclnI2lZH3HzNh71VBy5QKz3O4fFvQETjTI9hoKzKHjZNBz9ERKI8=@emersion.fr>
 <AIAAqwDqEh5BcgkyUT78Xaql.9.1632999287613.Hmail.guozhengkui@vivo.com>
 <HK2PR06MB34922067627E3951C991B678C7AA9@HK2PR06MB3492.apcprd06.prod.outlook.com>
 <AMEAtAA2EiXBtR0JiyxMeqon.9.1633002964630.Hmail.guozhengkui@vivo.com>
 <HK2PR06MB34925517684D29A3A65F7004C7AB9@HK2PR06MB3492.apcprd06.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <12b42051-761f-099e-6797-8512aa00f5a3@gmail.com>
Date: Fri, 1 Oct 2021 09:39:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <HK2PR06MB34925517684D29A3A65F7004C7AB9@HK2PR06MB3492.apcprd06.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------2B72E5D17A1A4CFBD380E9F9"
Content-Language: en-US
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

This is a multi-part message in MIME format.
--------------2B72E5D17A1A4CFBD380E9F9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

It means that you should modify your patch, yes.

Regards,
Christian.

Am 01.10.21 um 05:02 schrieb 郭正奎:
>
> So, it means I need to make another commit?
>
> Zhengkui
>
> *From:*guozhengkui@vivo.com <guozhengkui@vivo.com> *On Behalf Of 
> *Christian K?nig
> *Sent:* Thursday, September 30, 2021 7:56 PM
> *To:* Guo Zhengkui <guozhengkui@vivo.com>; Simon Ser <contact@emersion.fr>
> *Cc:* Deucher, Alexander <Alexander.Deucher@amd.com>; Pan, Xinhui 
> <Xinhui.Pan@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter 
> <daniel@ffwll.ch>; Chen, Guchun <Guchun.Chen@amd.com>; Zhou, Peng Ju 
> <PengJu.Zhou@amd.com>; Zhang, Bokun <Bokun.Zhang@amd.com>; Gao, Likun 
> <Likun.Gao@amd.com>; amd-gfx@lists.freedesktop.org; 
> dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; kernel 
> <kernel@vivo.com>
> *Subject:* Re: [PATCH] drm/amdgpu: fix some repeated includings
>
> Ah, that makes more sense. Then please remove the duplicates in lines 
> 46 and 47 instead since the other ones are more correctly grouped 
> together with their blocks.
>
> Christian.
>
> Am 30.09.21 um 13:54 schrieb 郭正奎:
>
>     Actually the duplicates take place in line 46, 47 and 62, 63.
>
>     diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>     b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>
>     index 291a47f7992a..94fca56583a0 100644
>
>     --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>
>     +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>
>     @@ -46,34 +46,32 @@
>
>     #include "vcn_v2_0.h"
>
>     #include "jpeg_v2_0.h"
>
>     #include "vcn_v2_5.h"
>
>     #include "jpeg_v2_5.h"
>
>     #include "smuio_v9_0.h"
>
>     #include "gmc_v10_0.h"
>
>     #include "gfxhub_v2_0.h"
>
>     #include "mmhub_v2_0.h"
>
>     #include "nbio_v2_3.h"
>
>     #include "nbio_v7_2.h"
>
>     #include "hdp_v5_0.h"
>
>     #include "nv.h"
>
>     #include "navi10_ih.h"
>
>     #include "gfx_v10_0.h"
>
>     #include "sdma_v5_0.h"
>
>     #include "sdma_v5_2.h"
>
>     -#include "vcn_v2_0.h"
>
>     -#include "jpeg_v2_0.h"
>
>     #include "vcn_v3_0.h"
>
>     #include "jpeg_v3_0.h"
>
>     #include "amdgpu_vkms.h"
>
>     #include "mes_v10_1.h"
>
>     #include "smuio_v11_0.h"
>
>     #include "smuio_v11_0_6.h"
>
>     #include "smuio_v13_0.h"
>
>     MODULE_FIRMWARE("amdgpu/ip_discovery.bin");
>
>     #define mmRCC_CONFIG_MEMSIZE   0xde3
>
>     #define mmMM_INDEX             0x0
>
>     #define mmMM_INDEX_HI          0x6
>
>     #define mmMM_DATA              0x1
>
>     static const char *hw_id_names[HW_ID_MAX] = {
>


--------------2B72E5D17A1A4CFBD380E9F9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    It means that you should modify your patch, yes.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 01.10.21 um 05:02 schrieb 郭正奎:<br>
    </div>
    <blockquote type="cite"
cite="mid:HK2PR06MB34925517684D29A3A65F7004C7AB9@HK2PR06MB3492.apcprd06.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style>@font-face
	{font-family:宋体;
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:等线;
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:"MS PGothic";
	panose-1:2 11 6 0 7 2 5 8 2 4;}@font-face
	{font-family:"\@等线";
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:"\@MS PGothic";}@font-face
	{font-family:"\@宋体";
	panose-1:2 1 6 0 3 1 1 1 1 1;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"MS PGothic",sans-serif;
	mso-fareast-language:JA;}span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:等线;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
            lang="EN-US">So, it means I need to make another commit?<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
            lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
            lang="EN-US">Zhengkui<o:p></o:p></span></p>
        <div>
          <div style="border:none;border-top:solid #E1E1E1
            1.0pt;padding:3.0pt 0cm 0cm 0cm">
            <p class="MsoNormal"><b><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:ZH-CN"
                  lang="EN-US">From:</span></b><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:ZH-CN"
                lang="EN-US"> <a class="moz-txt-link-abbreviated" href="mailto:guozhengkui@vivo.com">guozhengkui@vivo.com</a>
                <a class="moz-txt-link-rfc2396E" href="mailto:guozhengkui@vivo.com">&lt;guozhengkui@vivo.com&gt;</a> <b>On Behalf Of </b>Christian
                K?nig<br>
                <b>Sent:</b> Thursday, September 30, 2021 7:56 PM<br>
                <b>To:</b> Guo Zhengkui <a class="moz-txt-link-rfc2396E" href="mailto:guozhengkui@vivo.com">&lt;guozhengkui@vivo.com&gt;</a>;
                Simon Ser <a class="moz-txt-link-rfc2396E" href="mailto:contact@emersion.fr">&lt;contact@emersion.fr&gt;</a><br>
                <b>Cc:</b> Deucher, Alexander
                <a class="moz-txt-link-rfc2396E" href="mailto:Alexander.Deucher@amd.com">&lt;Alexander.Deucher@amd.com&gt;</a>; Pan, Xinhui
                <a class="moz-txt-link-rfc2396E" href="mailto:Xinhui.Pan@amd.com">&lt;Xinhui.Pan@amd.com&gt;</a>; David Airlie
                <a class="moz-txt-link-rfc2396E" href="mailto:airlied@linux.ie">&lt;airlied@linux.ie&gt;</a>; Daniel Vetter
                <a class="moz-txt-link-rfc2396E" href="mailto:daniel@ffwll.ch">&lt;daniel@ffwll.ch&gt;</a>; Chen, Guchun
                <a class="moz-txt-link-rfc2396E" href="mailto:Guchun.Chen@amd.com">&lt;Guchun.Chen@amd.com&gt;</a>; Zhou, Peng Ju
                <a class="moz-txt-link-rfc2396E" href="mailto:PengJu.Zhou@amd.com">&lt;PengJu.Zhou@amd.com&gt;</a>; Zhang, Bokun
                <a class="moz-txt-link-rfc2396E" href="mailto:Bokun.Zhang@amd.com">&lt;Bokun.Zhang@amd.com&gt;</a>; Gao, Likun
                <a class="moz-txt-link-rfc2396E" href="mailto:Likun.Gao@amd.com">&lt;Likun.Gao@amd.com&gt;</a>;
                <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>;
                <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>;
                <a class="moz-txt-link-abbreviated" href="mailto:linux-kernel@vger.kernel.org">linux-kernel@vger.kernel.org</a>; kernel
                <a class="moz-txt-link-rfc2396E" href="mailto:kernel@vivo.com">&lt;kernel@vivo.com&gt;</a><br>
                <b>Subject:</b> Re: [PATCH] drm/amdgpu: fix some
                repeated includings<o:p></o:p></span></p>
          </div>
        </div>
        <p class="MsoNormal"><span lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal" style="margin-bottom:12.0pt"><span
            lang="EN-US">Ah, that makes more sense. Then please remove
            the duplicates in lines 46 and 47 instead since the other
            ones are more correctly grouped together with their blocks.<br>
            <br>
            Christian.<o:p></o:p></span></p>
        <div>
          <p class="MsoNormal"><span lang="EN-US">Am 30.09.21 um 13:54
              schrieb </span><span lang="JA">郭正奎</span><span
              lang="EN-US">:<o:p></o:p></span></p>
        </div>
        <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">Actually the duplicates take place in line
              46, 47 and 62, 63.</span><span lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US"> </span><span lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">diff --git
              a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
              b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">index 291a47f7992a..94fca56583a0 100644</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">---
              a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">+++
              b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">@@ -46,34 +46,32 @@</span><span lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">#include "vcn_v2_0.h"</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">#include "jpeg_v2_0.h"</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">#include "vcn_v2_5.h"</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">#include "jpeg_v2_5.h"</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">#include "smuio_v9_0.h"</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">#include "gmc_v10_0.h"</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">#include "gfxhub_v2_0.h"</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">#include "mmhub_v2_0.h"</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">#include "nbio_v2_3.h"</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">#include "nbio_v7_2.h"</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">#include "hdp_v5_0.h"</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">#include "nv.h"</span><span lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">#include "navi10_ih.h"</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">#include "gfx_v10_0.h"</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">#include "sdma_v5_0.h"</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">#include "sdma_v5_2.h"</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">-#include "vcn_v2_0.h"</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">-#include "jpeg_v2_0.h"</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">#include "vcn_v3_0.h"</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">#include "jpeg_v3_0.h"</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">#include "amdgpu_vkms.h"</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">#include "mes_v10_1.h"</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">#include "smuio_v11_0.h"</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">#include "smuio_v11_0_6.h"</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">#include "smuio_v13_0.h"</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US"> </span><span lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">MODULE_FIRMWARE("amdgpu/ip_discovery.bin");</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US"> </span><span lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">#define mmRCC_CONFIG_MEMSIZE   0xde3</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">#define mmMM_INDEX             0x0</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">#define mmMM_INDEX_HI          0x6</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">#define mmMM_DATA              0x1</span><span
              lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US"> </span><span lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN"
              lang="EN-US">static const char *hw_id_names[HW_ID_MAX] = {</span><span
              lang="EN-US"><o:p></o:p></span></p>
        </blockquote>
        <p class="MsoNormal"><span
            style="font-family:宋体;mso-fareast-language:ZH-CN"
            lang="EN-US"><o:p> </o:p></span></p>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------2B72E5D17A1A4CFBD380E9F9--
