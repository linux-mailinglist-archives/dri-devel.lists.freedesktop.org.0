Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 333BAB0A3F7
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 14:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4041B10E9A2;
	Fri, 18 Jul 2025 12:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=robert.mader@collabora.com header.b="X7Szm/cq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C7A10E9A2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 12:17:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1752841066; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=WCieDj8ie6TfxjAoqc2NMj/D39fMO1Rw9ZbS+34f+db+U5EqTv8Et+zfVrbeKEw6M10HQzmf3o6rbWtQy+yZW0u+tATGLSdZ+2mwLmngfX9xfG4iyda5Lub/oy4gdcCmXQ5gqq+etzZvmB+uwTc7Hzq0tJP5XH9PoxTJlTrdhd8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1752841066;
 h=Content-Type:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=IHsBY/+vM1l3A3QwnPNNYowNklmwlOizlpuNk5p9li0=; 
 b=N9Dvi7+boPycnRdQ4PGmYaJShXkgaUqq9J9/nhyrpX8NMp2RUHS+O2Mw8+DsEG7V+OoVBmW982d0G3no6mef+kUppdXe9WDvhhNDdOlsJtijR5G171zgZ+DCWEDydWgeIM4ZRlEMjlhfYEWHVTvknLGuNTTsWQfwPIGF3ePMVwQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=robert.mader@collabora.com;
 dmarc=pass header.from=<robert.mader@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752841066; 
 s=zohomail; d=collabora.com; i=robert.mader@collabora.com;
 h=Content-Type:Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Message-Id:Reply-To:Cc;
 bh=IHsBY/+vM1l3A3QwnPNNYowNklmwlOizlpuNk5p9li0=;
 b=X7Szm/cqWlkyYgd4mbTB9JPoCBaNwdC0iKmWN1LGrA/+Ru5EndxceTQK96YoFifj
 YrCyHhM7MvFYNMwa9fSPerv5jVsiWgtSpufSaS97qUMkCS9ZC6QAy9tnYWWooH6c+GX
 ZU+ANK+AE8cN2kTZ3uT7SvkiHo3yJtAp8dGrq1Mo=
Received: by mx.zohomail.com with SMTPS id 1752841064423307.94703616041807;
 Fri, 18 Jul 2025 05:17:44 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------0P0Cmgy2xcJ6oII1vtIxEXbW"
Message-ID: <29535391-5863-4a73-a217-9916cb1ea690@collabora.com>
Date: Fri, 18 Jul 2025 14:17:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/vkms: Add writeback encoders as possible clones
To: Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org
References: <20250703090335.23595-1-robert.mader@collabora.com>
 <8449716a-9c8b-424b-b12f-d5b272e051b3@bootlin.com>
Content-Language: en-US, de-DE
From: Robert Mader <robert.mader@collabora.com>
In-Reply-To: <8449716a-9c8b-424b-b12f-d5b272e051b3@bootlin.com>
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
--------------0P0Cmgy2xcJ6oII1vtIxEXbW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18.07.25 12:23, Louis Chauvet wrote:
>
>
> Le 03/07/2025 à 11:03, Robert Mader a écrit :
>> Since commit 41b4b11da0215 ("drm: Add valid clones check") setting
>> the `possible_clones` values is a hard requirement for cloning.
>> `vkms` supports cloning for writeback connectors in order to capture
>> CRTC content, however that broke with said commit.
>>
>> Writeback connectors are created on a per-CRTC basis, thus mark
>> every non-writeback connector that is compatible with a given CRTC
>> as possible clone - and vice-versa.
>>
>> Using a default configuration, the corresponding `drm_info` output
>> changes from:
>>
>> ├───Encoders
>> │   ├───Encoder 0
>> │   │   ├───Object ID: 40
>> │   │   ├───Type: virtual
>> │   │   ├───CRTCS: {0}
>> │   │   └───Clones: {0}
>> │   └───Encoder 1
>> │       ├───Object ID: 41
>> │       ├───Type: virtual
>> │       ├───CRTCS: {0}
>> │       └───Clones: {1}
>>
>> to:
>>
>> ├───Encoders
>> │   ├───Encoder 0
>> │   │   ├───Object ID: 44
>> │   │   ├───Type: virtual
>> │   │   ├───CRTCS: {0}
>> │   │   └───Clones: {0, 1}
>> │   └───Encoder 1
>> │       ├───Object ID: 50
>> │       ├───Type: virtual
>> │       ├───CRTCS: {0}
>> │       └───Clones: {0, 1}
>>
>> Signed-off-by: Robert Mader <robert.mader@collabora.com>
>
> Hi,
>
> About the Fixes tag, I think you can add it anyway, if the patch is 
> not applicable on previous kernel version, this is not an issue, it 
> will just be ignored.

Alright, added

Fixes: dbd9d80c1b2e (drm/vkms: Add support for writeback)

in v2.

>
>> ---
>>   drivers/gpu/drm/vkms/vkms_output.c    | 12 ++++++++++++
>>   drivers/gpu/drm/vkms/vkms_writeback.c |  2 ++
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_output.c 
>> b/drivers/gpu/drm/vkms/vkms_output.c
>> index 8d7ca0cdd79f..21935eb88198 100644
>> --- a/drivers/gpu/drm/vkms/vkms_output.c
>> +++ b/drivers/gpu/drm/vkms/vkms_output.c
>> @@ -77,9 +77,21 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>>               return ret;
>>           }
>>   +        encoder_cfg->encoder->possible_clones |= 
>> BIT(drm_encoder_index(encoder_cfg->encoder));
>> +
>> vkms_config_encoder_for_each_possible_crtc(encoder_cfg, idx, 
>> possible_crtc) {
>>               encoder_cfg->encoder->possible_crtcs |=
>> drm_crtc_mask(&possible_crtc->crtc->crtc);
>> +
>> +            if (vkms_config_crtc_get_writeback(possible_crtc)) {
>> +                struct drm_encoder *wb_encoder =
>> +                    &possible_crtc->crtc->wb_encoder;
>> +
>> +                encoder_cfg->encoder->possible_clones |=
>> +                    BIT(drm_encoder_index(wb_encoder));
>> +                wb_encoder->possible_clones |=
>> + BIT(drm_encoder_index(encoder_cfg->encoder));
>
> Can you use drm_encoder_mask directly?
Much better, done for all places in v2.
>
> Thanks a lot for this patch,
> Louis Chauvet
Thanks for the feedback!
>
>> +            }
>>           }
>>       }
>>   diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c 
>> b/drivers/gpu/drm/vkms/vkms_writeback.c
>> index fe163271d5b5..12b60fb97c68 100644
>> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
>> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
>> @@ -174,6 +174,8 @@ int vkms_enable_writeback_connector(struct 
>> vkms_device *vkmsdev,
>>       if (ret)
>>           return ret;
>>       vkms_output->wb_encoder.possible_crtcs |= 
>> drm_crtc_mask(&vkms_output->crtc);
>> +    vkms_output->wb_encoder.possible_clones |=
>> + BIT(drm_encoder_index(&vkms_output->wb_encoder));
>>         drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
>
-- 
Robert Mader
Consultant Software Developer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

--------------0P0Cmgy2xcJ6oII1vtIxEXbW
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 18.07.25 12:23, Louis Chauvet wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:8449716a-9c8b-424b-b12f-d5b272e051b3@bootlin.com">
      <br>
      <br>
      Le 03/07/2025 à 11:03, Robert Mader a écrit :
      <br>
      <blockquote type="cite">Since commit 41b4b11da0215 ("drm: Add
        valid clones check") setting
        <br>
        the `possible_clones` values is a hard requirement for cloning.
        <br>
        `vkms` supports cloning for writeback connectors in order to
        capture
        <br>
        CRTC content, however that broke with said commit.
        <br>
        <br>
        Writeback connectors are created on a per-CRTC basis, thus mark
        <br>
        every non-writeback connector that is compatible with a given
        CRTC
        <br>
        as possible clone - and vice-versa.
        <br>
        <br>
        Using a default configuration, the corresponding `drm_info`
        output
        <br>
        changes from:
        <br>
        <br>
        ├───Encoders
        <br>
        │   ├───Encoder 0
        <br>
        │   │   ├───Object ID: 40
        <br>
        │   │   ├───Type: virtual
        <br>
        │   │   ├───CRTCS: {0}
        <br>
        │   │   └───Clones: {0}
        <br>
        │   └───Encoder 1
        <br>
        │       ├───Object ID: 41
        <br>
        │       ├───Type: virtual
        <br>
        │       ├───CRTCS: {0}
        <br>
        │       └───Clones: {1}
        <br>
        <br>
        to:
        <br>
        <br>
        ├───Encoders
        <br>
        │   ├───Encoder 0
        <br>
        │   │   ├───Object ID: 44
        <br>
        │   │   ├───Type: virtual
        <br>
        │   │   ├───CRTCS: {0}
        <br>
        │   │   └───Clones: {0, 1}
        <br>
        │   └───Encoder 1
        <br>
        │       ├───Object ID: 50
        <br>
        │       ├───Type: virtual
        <br>
        │       ├───CRTCS: {0}
        <br>
        │       └───Clones: {0, 1}
        <br>
        <br>
        Signed-off-by: Robert Mader <a class="moz-txt-link-rfc2396E" href="mailto:robert.mader@collabora.com">&lt;robert.mader@collabora.com&gt;</a>
        <br>
      </blockquote>
      <br>
      Hi,
      <br>
      <br>
      About the Fixes tag, I think you can add it anyway, if the patch
      is not applicable on previous kernel version, this is not an
      issue, it will just be ignored.<br>
    </blockquote>
    <p>Alright, added</p>
    <pre>Fixes: dbd9d80c1b2e (drm/vkms: Add support for writeback)
</pre>
    <p>in v2.<br>
    </p>
    <blockquote type="cite"
      cite="mid:8449716a-9c8b-424b-b12f-d5b272e051b3@bootlin.com">
      <br>
      <blockquote type="cite">---
        <br>
          drivers/gpu/drm/vkms/vkms_output.c    | 12 ++++++++++++
        <br>
          drivers/gpu/drm/vkms/vkms_writeback.c |  2 ++
        <br>
          2 files changed, 14 insertions(+)
        <br>
        <br>
        diff --git a/drivers/gpu/drm/vkms/vkms_output.c
        b/drivers/gpu/drm/vkms/vkms_output.c
        <br>
        index 8d7ca0cdd79f..21935eb88198 100644
        <br>
        --- a/drivers/gpu/drm/vkms/vkms_output.c
        <br>
        +++ b/drivers/gpu/drm/vkms/vkms_output.c
        <br>
        @@ -77,9 +77,21 @@ int vkms_output_init(struct vkms_device
        *vkmsdev)
        <br>
                      return ret;
        <br>
                  }
        <br>
          +        encoder_cfg-&gt;encoder-&gt;possible_clones |=
        BIT(drm_encoder_index(encoder_cfg-&gt;encoder));
        <br>
        +
        <br>
                 
        vkms_config_encoder_for_each_possible_crtc(encoder_cfg, idx,
        possible_crtc) {
        <br>
                      encoder_cfg-&gt;encoder-&gt;possible_crtcs |=
        <br>
                         
        drm_crtc_mask(&amp;possible_crtc-&gt;crtc-&gt;crtc);
        <br>
        +
        <br>
        +            if (vkms_config_crtc_get_writeback(possible_crtc))
        {
        <br>
        +                struct drm_encoder *wb_encoder =
        <br>
        +                    &amp;possible_crtc-&gt;crtc-&gt;wb_encoder;
        <br>
        +
        <br>
        +                encoder_cfg-&gt;encoder-&gt;possible_clones |=
        <br>
        +                    BIT(drm_encoder_index(wb_encoder));
        <br>
        +                wb_encoder-&gt;possible_clones |=
        <br>
        +                   
        BIT(drm_encoder_index(encoder_cfg-&gt;encoder));
        <br>
      </blockquote>
      <br>
      Can you use drm_encoder_mask directly?
      <br>
    </blockquote>
    Much better, done for all places in v2.<br>
    <blockquote type="cite"
      cite="mid:8449716a-9c8b-424b-b12f-d5b272e051b3@bootlin.com">
      <br>
      Thanks a lot for this patch,
      <br>
      Louis Chauvet
      <br>
    </blockquote>
    Thanks for the feedback!
    <blockquote type="cite"
      cite="mid:8449716a-9c8b-424b-b12f-d5b272e051b3@bootlin.com">
      <br>
      <blockquote type="cite">+            }
        <br>
                  }
        <br>
              }
        <br>
          diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c
        b/drivers/gpu/drm/vkms/vkms_writeback.c
        <br>
        index fe163271d5b5..12b60fb97c68 100644
        <br>
        --- a/drivers/gpu/drm/vkms/vkms_writeback.c
        <br>
        +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
        <br>
        @@ -174,6 +174,8 @@ int vkms_enable_writeback_connector(struct
        vkms_device *vkmsdev,
        <br>
              if (ret)
        <br>
                  return ret;
        <br>
              vkms_output-&gt;wb_encoder.possible_crtcs |=
        drm_crtc_mask(&amp;vkms_output-&gt;crtc);
        <br>
        +    vkms_output-&gt;wb_encoder.possible_clones |=
        <br>
        +       
        BIT(drm_encoder_index(&amp;vkms_output-&gt;wb_encoder));
        <br>
                drm_connector_helper_add(&amp;wb-&gt;base,
        &amp;vkms_wb_conn_helper_funcs);
        <br>
          </blockquote>
      <br>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Robert Mader
Consultant Software Developer 

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England &amp; Wales, no. 5513718</pre>
  </body>
</html>

--------------0P0Cmgy2xcJ6oII1vtIxEXbW--
