Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AB695B636
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 15:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9B110EA7D;
	Thu, 22 Aug 2024 13:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fOh6K4vC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E0910EA5B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 13:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724332494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VjpStOY2tZRsWe7659pvw1wDWH9gZfVqjlnowrqh2XU=;
 b=fOh6K4vCFMXLVzpKFwoFUyITRUfmz1tVbPvCVttofTcg8QcVrlMh/dmmlilMXjy7n5Qn/A
 LMjQcO9TheeZkOMu0n7glwcJCtIthHh/PwyXZtc6R3BxGAv07ecx9dmwPI01lPTo0qB2KG
 PvOHdmYZYestMSCte1y/rxhpl/2aH1M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-psCgb-ZvPrqVCtJYk7DpjA-1; Thu, 22 Aug 2024 09:14:52 -0400
X-MC-Unique: psCgb-ZvPrqVCtJYk7DpjA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42816096cb8so8162555e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 06:14:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724332490; x=1724937290;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VjpStOY2tZRsWe7659pvw1wDWH9gZfVqjlnowrqh2XU=;
 b=USVbXwlO2UX6DJ1BEbG5PD+8bqAxvruYvGztFHGFxlkKS3fzsIzq2X8VKXiQKK7E89
 KITHRj7aZ/lqUevp/nssEAHEAB8MD9Eb34UVriArkRJxTQBeHxQxoWlqBB0XCHTENMng
 OafB6FXf/3gxcIi61F4gqCrHPFJZdCou1DusBKrGVzJXQTT/2iXCF/zRP+OzR+FSeVPW
 P2HMEdFsdcP+YiQkexuqa9Bm+fsz/isNpEcvHKdYziXHpd4VGcj9DfhIDwaTr5knxfI6
 l5TUjGk0YgDQenFQXcsU+FnETJghVK3pLNTAj/sphRKKgwjJsR3ZAGCVIffeGnKsSFDa
 SkbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUts5OQa/PlsxssOeLfiuqk7Gyapt7FvuAyxx4N1UF5HvjYIBDKDJf/z23Y4hn1tf62iZHsTQn3FTk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzP2JI5K8iDLVdhJNM8oES7Sumwylvyp4K+xvvRKCZFg0Ved+tc
 Fv/PDJPTlC3h6XqatloKrkhymCT4Qmyqe6xPcWer43DYsNzr9kSVolLHl/0IuevbrVV2sD3mRfk
 zMA2po2TBKcMHnoMNTKW+B3kdo7xEnJHBanNEQgqhGidimbOzm16c2Qqy7NLNfoVdTw==
X-Received: by 2002:a05:600c:1f1b:b0:426:5c81:2538 with SMTP id
 5b1f17b1804b1-42ac55cbf78mr16184785e9.14.1724332490421; 
 Thu, 22 Aug 2024 06:14:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhA7gC2VdvVqzYSk0wAWJHB/+5+dYhcALlheQ+TK94kTmFHmle2ajWyTmgc1AUzZnwZ09QnA==
X-Received: by 2002:a05:600c:1f1b:b0:426:5c81:2538 with SMTP id
 5b1f17b1804b1-42ac55cbf78mr16184405e9.14.1724332489857; 
 Thu, 22 Aug 2024 06:14:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ac515914bsm24052965e9.12.2024.08.22.06.14.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Aug 2024 06:14:49 -0700 (PDT)
Message-ID: <0e17c77a-75bd-4ee7-a0d0-8c164b300ea4@redhat.com>
Date: Thu, 22 Aug 2024 15:14:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] drm/panic: Simplify logo handling
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>
References: <20240822073852.562286-1-jfalempe@redhat.com>
 <20240822073852.562286-4-jfalempe@redhat.com>
 <166850ea-ef40-4868-be26-681ea7a0bca4@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <166850ea-ef40-4868-be26-681ea7a0bca4@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/08/2024 15:00, Thomas Zimmermann wrote:
> 
> 
> Am 22.08.24 um 09:33 schrieb Jocelyn Falempe:
>> Move logo rectangle initialisation, and logo drawing in separate
>> functions, so they can be re-used by different panic screens.
>> It prepares the introduction of the QR code panic screen.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> with the comments considered.

Sure, I will change the const int to const size_t before pushing.

Thanks

-- 

Jocelyn
> 
>> ---
>>
>> v6:
>>   * rebase, and handle conflict with 5d45c01dea6f ("drm/panic: Add 
>> panic description")
>>
>>   drivers/gpu/drm/drm_panic.c | 58 +++++++++++++++++++++----------------
>>   1 file changed, 33 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
>> index 59fba23e5fd7a..473db5fafb617 100644
>> --- a/drivers/gpu/drm/drm_panic.c
>> +++ b/drivers/gpu/drm/drm_panic.c
>> @@ -85,7 +85,7 @@ static struct drm_panic_line panic_msg[] = {
>>       PANIC_LINE(""), /* will be replaced by the panic description */
>>   };
>> -#define PANIC_MSG_LINES ARRAY_SIZE(panic_msg)
>> +static const int panic_msg_lines = ARRAY_SIZE(panic_msg);
> 
> This type should be size_t instead of int
> 
>>   static const struct drm_panic_line logo_ascii[] = {
>>       PANIC_LINE("     .--.        _"),
>> @@ -97,7 +97,7 @@ static const struct drm_panic_line logo_ascii[] = {
>>       PANIC_LINE(" \\___)=(___/"),
>>   };
>> -#define PANIC_LOGO_LINES ARRAY_SIZE(logo_ascii)
>> +static const int logo_ascii_lines = ARRAY_SIZE(logo_ascii);
> 
> size_t
> 
>>   #if defined(CONFIG_LOGO) && !defined(MODULE)
>>   static const struct linux_logo *logo_mono;
>> @@ -496,31 +496,44 @@ static void draw_txt_rectangle(struct 
>> drm_scanout_buffer *sb,
>>       }
>>   }
>> +static void drm_panic_logo_rect(struct drm_rect *rect, const struct 
>> font_desc *font)
>> +{
>> +    if (logo_mono)
>> +        drm_rect_init(rect, 0, 0, logo_mono->width, logo_mono->height);
>> +    else {
>> +        int logo_width = get_max_line_len(logo_ascii, 
>> logo_ascii_lines) * font->width;
>> +
>> +        drm_rect_init(rect, 0, 0, logo_width, logo_ascii_lines * 
>> font->height);
>> +    }
>> +}
>> +
>> +static void drm_panic_logo_draw(struct drm_scanout_buffer *sb, struct 
>> drm_rect *rect,
>> +                const struct font_desc *font, u32 fg_color)
>> +{
>> +    if (logo_mono)
>> +        drm_panic_blit(sb, rect, logo_mono->data,
>> +                   DIV_ROUND_UP(drm_rect_width(rect), 8), 1, fg_color);
>> +    else
>> +        draw_txt_rectangle(sb, font, logo_ascii, logo_ascii_lines, 
>> false, rect,
>> +                   fg_color);
>> +}
>> +
>>   static void draw_panic_static_user(struct drm_scanout_buffer *sb)
>>   {
>>       u32 fg_color = 
>> convert_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR, 
>> sb->format->format);
>>       u32 bg_color = 
>> convert_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR, 
>> sb->format->format);
>>       const struct font_desc *font = get_default_font(sb->width, 
>> sb->height, NULL, NULL);
>>       struct drm_rect r_screen, r_logo, r_msg;
>> -    unsigned int logo_width, logo_height;
>>       unsigned int msg_width, msg_height;
>>       if (!font)
>>           return;
>>       r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
>> +    drm_panic_logo_rect(&r_logo, font);
>> -    if (logo_mono) {
>> -        logo_width = logo_mono->width;
>> -        logo_height = logo_mono->height;
>> -    } else {
>> -        logo_width = get_max_line_len(logo_ascii, PANIC_LOGO_LINES) * 
>> font->width;
>> -        logo_height = PANIC_LOGO_LINES * font->height;
>> -    }
>> -    r_logo = DRM_RECT_INIT(0, 0, logo_width, logo_height);
>> -
>> -    msg_width = min(get_max_line_len(panic_msg, PANIC_MSG_LINES) * 
>> font->width, sb->width);
>> -    msg_height = min(PANIC_MSG_LINES * font->height, sb->height);
>> +    msg_width = min(get_max_line_len(panic_msg, panic_msg_lines) * 
>> font->width, sb->width);
>> +    msg_height = min(panic_msg_lines * font->height, sb->height);
>>       r_msg = DRM_RECT_INIT(0, 0, msg_width, msg_height);
>>       /* Center the panic message */
>> @@ -529,15 +542,10 @@ static void draw_panic_static_user(struct 
>> drm_scanout_buffer *sb)
>>       /* Fill with the background color, and draw text on top */
>>       drm_panic_fill(sb, &r_screen, bg_color);
>> -    if (!drm_rect_overlap(&r_logo, &r_msg)) {
>> -        if (logo_mono)
>> -            drm_panic_blit(sb, &r_logo, logo_mono->data, 
>> DIV_ROUND_UP(logo_width, 8),
>> -                       fg_color);
>> -        else
>> -            draw_txt_rectangle(sb, font, logo_ascii, 
>> PANIC_LOGO_LINES, false, &r_logo,
>> -                       fg_color);
>> -    }
>> -    draw_txt_rectangle(sb, font, panic_msg, PANIC_MSG_LINES, true, 
>> &r_msg, fg_color);
>> +    if (!drm_rect_overlap(&r_logo, &r_msg))
>> +        drm_panic_logo_draw(sb, &r_logo, font, fg_color);
>> +
>> +    draw_txt_rectangle(sb, font, panic_msg, panic_msg_lines, true, 
>> &r_msg, fg_color);
>>   }
>>   /*
>> @@ -647,7 +655,7 @@ static void drm_panic_set_description(const char 
>> *description)
>>       u32 len;
>>       if (description) {
>> -        struct drm_panic_line *desc_line = &panic_msg[PANIC_MSG_LINES 
>> - 1];
>> +        struct drm_panic_line *desc_line = &panic_msg[panic_msg_lines 
>> - 1];
>>           desc_line->txt = description;
>>           len = strlen(description);
>> @@ -660,7 +668,7 @@ static void drm_panic_set_description(const char 
>> *description)
>>   static void drm_panic_clear_description(void)
>>   {
>> -    struct drm_panic_line *desc_line = &panic_msg[PANIC_MSG_LINES - 1];
>> +    struct drm_panic_line *desc_line = &panic_msg[panic_msg_lines - 1];
>>       desc_line->len = 0;
>>       desc_line->txt = NULL;
> 

