Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7880FB3E46A
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 15:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB1510E45B;
	Mon,  1 Sep 2025 13:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IfpqyKbU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 554F610E45B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 13:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756732582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/E9FHFC9caBJzTnTpVFypUS6buU8BbMb0alSV3yJyng=;
 b=IfpqyKbU+23nYeSJ+pux165BdPOLhPueHHCSSbUvOFqMxEXanmCvR04h3Q0RKQInpd6vak
 n9SMfzvkgMWwi26HCzGgbNXqBlqd15jU6hCg4kYMuGrkWWDOoNFnogmWUzwX1rOWa1zQxf
 f8QRpFJE3JwBysQpNw7LRkkVWsWyYKU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-1Y2jdPBKMI2y5LdMDR1qaA-1; Mon, 01 Sep 2025 09:16:19 -0400
X-MC-Unique: 1Y2jdPBKMI2y5LdMDR1qaA-1
X-Mimecast-MFC-AGG-ID: 1Y2jdPBKMI2y5LdMDR1qaA_1756732578
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3ce5b306365so2873930f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 06:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756732578; x=1757337378;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/E9FHFC9caBJzTnTpVFypUS6buU8BbMb0alSV3yJyng=;
 b=RwrBZiypUtHThjPNGub7Nk2w7tE6lpWbZ/5cDKbxecoDEBwr3Xp1IM8zzh2JHN356h
 FG7pY+rxbb3WdIT6224FOQZ1O8S+BgMnLMZWE9D7tP7rEjn+kXp4cZ+ELPAClkBqdqoF
 FZEtLBbBikYz+FfsJNxp8lhD4BNQLYgMEwJkDxgiRYwJ3jE76ubSKq2x0YlcXkJO/Ia/
 AIAalducNepJRAgnqGD/iksoTLlbeqwcx7oC7+dF66JzY3mxfQrKyTcOSNTn3Qv0qzeW
 Mt6aHE3cJwqe5fCDTU8f0l5p/TUySysLgqjf/mqxlMU8EWM9o0zK/Dp4tZPBuX8KhEu1
 KIXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPJM1I9pPSiJVZ4f3jqeaRNKBs9E6kBZrIfGz0NL5rFmd89de7BG5s8pLu29I6VDI7Qv2+OWwILBA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJ6FenzotckWNp1KaPaSF3opidhULdB7gLpOiEFS28XJ0XnjnR
 JQoyg9Dr+Ls0xz8LdNcG4Vu0SPIuvPTQl/8mVKnpZq3QVWdFMXElUGSS7vdO60hWz9qoun5SOyw
 oqWJHyEc4gJbtrGVvB7N/lv8Bl7RFOMKM4+u4M9xa2n45y0caeA6SHrUwpLjMIRWbTe8STA==
X-Gm-Gg: ASbGncuzxAd9ek+McyC8npFJ44QJPTJj2J86/j7QMox0sB/+Sp5dprcJkrvrD+TeoWp
 RGzHgJCFN6jG9WPf+/o9xAWt4s0X7FBC9P+iKc3D121OdZpEgz5RfHQ+bpPPNAaIEDpwauNBYVU
 qPfguHB4YdIapkmidhjNuLYpXaE+1i0f9yyktirCHnGgWK9aodMUr4u1pwRPvmWmo1ItbH2QAFV
 9mLYick/MXT2H5QUslwV9S5k/fnaaqRr/KAbC6GbzpUlB99qF1+LiaetFdt6mEpEVr+k7YFTZ6Y
 HFZr0pWK8d/hCibHCdO+CvKpnRySfoWcFUX2eR98HzOBrS2Czdbq7tQDlsPas8lbyAGq1y1z5zj
 FZNE=
X-Received: by 2002:adf:a350:0:b0:3d2:52e3:920c with SMTP id
 ffacd0b85a97d-3d252e39ae7mr4259417f8f.44.1756732578166; 
 Mon, 01 Sep 2025 06:16:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMMo/FX6gLCbb9MPBn1nmMCgGwLpPc/FdeUFPte52EQzVd0EWOwOLg5M0J2p3dvJsJSOVvAw==
X-Received: by 2002:adf:a350:0:b0:3d2:52e3:920c with SMTP id
 ffacd0b85a97d-3d252e39ae7mr4259394f8f.44.1756732577622; 
 Mon, 01 Sep 2025 06:16:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b8efb280csm14242245e9.3.2025.09.01.06.16.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 06:16:17 -0700 (PDT)
Message-ID: <29f77752-a4df-4a12-96d3-4ccd52bd5b89@redhat.com>
Date: Mon, 1 Sep 2025 15:16:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/panic: Add a kconfig option to dump kunits
 results to png
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250821095228.648156-1-jfalempe@redhat.com>
 <20250821095228.648156-4-jfalempe@redhat.com>
 <20250827-imperial-amigurumi-malkoha-b99a9d@houat>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250827-imperial-amigurumi-malkoha-b99a9d@houat>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G0wbQvDmS1C9AFjYyAM1N833eexATAeRCSEw-ZehehA_1756732578
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

On 27/08/2025 11:52, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Aug 21, 2025 at 11:49:07AM +0200, Jocelyn Falempe wrote:
>> This is a bit hacky, but very handy if you want to customize the
>> panic screen.
>> It allows to dump the generated images to the logs, and then a python
>> script can convert it to .png files. It makes it easy to check how
>> the panic screen will look on different resolutions, without having
>> to crash a VM.
>> To not pollute the logs, it uses a monochrome framebuffer, compress
>> it with zlib, and base64 encode it.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/Kconfig.debug          |  14 ++++
>>   drivers/gpu/drm/tests/drm_panic_test.c | 111 +++++++++++++++++++++++++
>>   scripts/kunitpanic2png.py              |  53 ++++++++++++
>>   3 files changed, 178 insertions(+)
>>   create mode 100755 scripts/kunitpanic2png.py
>>
>> diff --git a/drivers/gpu/drm/Kconfig.debug b/drivers/gpu/drm/Kconfig.debug
>> index 05dc43c0b8c5..d8ae85132d32 100644
>> --- a/drivers/gpu/drm/Kconfig.debug
>> +++ b/drivers/gpu/drm/Kconfig.debug
>> @@ -84,6 +84,20 @@ config DRM_KUNIT_TEST
>>   
>>   	  If in doubt, say "N".
>>   
>> +config DRM_PANIC_KUNIT_TEST_DUMP
>> +	bool "Enable screen dump to logs in KUnit tests for drm_panic"
>> +	default n
>> +	depends on DRM && DRM_PANIC && DRM_KUNIT_TEST
>> +	select ZLIB_DEFLATE
>> +	help
>> +	  This allows to dump the panic screen to the KUnit tests logs.
>> +	  It's possible with a small python script to write pngs from the logs.
>> +
>> +	  This is only to help developers customizing the drm_panic screen,
>> +	  checking the result for different resolutions.
>> +
>> +	  If in doubt, say "N"
>> +
>>   config DRM_TTM_KUNIT_TEST
>>   	tristate "KUnit tests for TTM" if !KUNIT_ALL_TESTS
>>   	default n
>> diff --git a/drivers/gpu/drm/tests/drm_panic_test.c b/drivers/gpu/drm/tests/drm_panic_test.c
>> index 46ff3e5e0e5d..8cddb845aea9 100644
>> --- a/drivers/gpu/drm/tests/drm_panic_test.c
>> +++ b/drivers/gpu/drm/tests/drm_panic_test.c
>> @@ -115,24 +115,135 @@ static void drm_test_panic_screen_user_page(struct kunit *test)
>>   	kfree(pages);
>>   }
>>   
>> +#ifdef CONFIG_DRM_PANIC_KUNIT_TEST_DUMP
>> +#include <linux/base64.h>
>> +#include <linux/delay.h>
>> +#include <linux/zlib.h>
>> +
>> +#define LINE_LEN 128
>> +
>> +#define COMPR_LEVEL 6
>> +#define WINDOW_BITS 12
>> +#define MEM_LEVEL 4
>> +
>> +static int compress_image(u8 *src, int size, u8 *dst)
>> +{
>> +	struct z_stream_s stream;
>> +
>> +	stream.workspace = kmalloc(zlib_deflate_workspacesize(WINDOW_BITS, MEM_LEVEL),
>> +				   GFP_KERNEL);
>> +
>> +	if (zlib_deflateInit2(&stream, COMPR_LEVEL, Z_DEFLATED, WINDOW_BITS,
>> +			      MEM_LEVEL, Z_DEFAULT_STRATEGY) != Z_OK)
>> +		return -EINVAL;
>> +
>> +	stream.next_in = src;
>> +	stream.avail_in = size;
>> +	stream.total_in = 0;
>> +	stream.next_out = dst;
>> +	stream.avail_out = size;
>> +	stream.total_out = 0;
>> +
>> +	if (zlib_deflate(&stream, Z_FINISH) != Z_STREAM_END)
>> +		return -EINVAL;
>> +
>> +	if (zlib_deflateEnd(&stream) != Z_OK)
>> +		return -EINVAL;
>> +
>> +	kfree(stream.workspace);
>> +
>> +	return stream.total_out;
>> +}
>> +
>> +static void dump_image(u8 *fb, unsigned int width, unsigned int height)
>> +{
>> +	int len = 0;
>> +	char *dst;
>> +	char *compressed;
>> +	int sent = 0;
>> +	int stride = DIV_ROUND_UP(width, 8);
>> +	int size = stride * height;
>> +
>> +	compressed = vzalloc(size);
>> +	if (!compressed)
>> +		return;
>> +	len = compress_image(fb, size, compressed);
>> +	if (len < 0) {
>> +		pr_err("Compression failed %d", len);
>> +		return;
>> +	}
>> +
>> +	dst = vzalloc(4 * DIV_ROUND_UP(len, 3) + 1);
>> +	if (!dst)
>> +		return;
>> +
>> +	len = base64_encode(compressed, len, dst);
>> +
>> +	pr_info("KUNIT PANIC IMAGE DUMP START %dx%d", width, height);
>> +	while (len > 0) {
>> +		char save = dst[sent + LINE_LEN];
>> +
>> +		dst[sent + LINE_LEN] = 0;
>> +		pr_info("%s", dst + sent);
>> +		dst[sent + LINE_LEN] = save;
>> +		sent += LINE_LEN;
>> +		len -= LINE_LEN;
>> +	}
>> +	pr_info("KUNIT PANIC IMAGE DUMP END");
> 
> The kunit test output format is defined, and we should probably use a
> diagnostic line for this:
> https://docs.kernel.org/dev-tools/ktap.html#diagnostic-lines
> 
> We should probably cc the kunit maintainers about this too.

Thanks for the pointer, I will also experiment with debugfs, as 
suggested by Thomas.

Best regards,

-- 

Jocelyn



> 
> Maxime

