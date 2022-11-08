Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08ED4620BEE
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 10:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C0610E3B5;
	Tue,  8 Nov 2022 09:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1546B10E3A1
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 09:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667899021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4pHBT/fJh3ulUnX/PuZq24dJd81X6jP0SS5Hkn26CnQ=;
 b=PRKIZXFIyHdRVu2EPvA1nm1C149khiRFHsJq8Od/pjVqocsuQfG8zdpuIqc/t7xrDWIPMn
 +kmcfnqYIIdR0CysVwUuwBAODRzIU3YNYhced8YQsR39qDVcQF65QZ8XvOBYg9zHDw4Lf8
 n2uC1XYYbo31SrVhPxH6zFjENnTnrwM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-412--f-9BdYvNHuYWL_kZ5MJkA-1; Tue, 08 Nov 2022 04:16:57 -0500
X-MC-Unique: -f-9BdYvNHuYWL_kZ5MJkA-1
Received: by mail-ej1-f71.google.com with SMTP id
 qa14-20020a170907868e00b007ae24f77742so7182215ejc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 01:16:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4pHBT/fJh3ulUnX/PuZq24dJd81X6jP0SS5Hkn26CnQ=;
 b=YBh2YTXeQ4ZxqADIlWQVSDbbo7G7QLJkzfgD7YdHR+w5OdZVHZq2A+784hGxEso+1V
 swo3tt1W8ToLMTKKYzByfQ3hOQLgK3r2hfzLnGy5pOPIA6YcXyih9BFyLzc9Ab6yJDH+
 mZsJVMxKKLsvMy/4W+JiW5EH5av6H7nopiHvjwUekSj+VCjcs2zYTDtiGWA86xZMFE9J
 PHH8UbuiOLcdMLUzMRezWpaqxj6w6aD01Jcf0YXcT3i3MvTtbHsjzU3lACz/nw/14OL+
 OgFDxcPu5ZhX/8E51bAZBi8AGcCPn8idStAlIot+nuWuI6JgN4xh/FHz8GRPyBOKZvPc
 5cEQ==
X-Gm-Message-State: ACrzQf3Ek1INbpB5U1zWOnmSHbWEt4Wlb40W83xxSPx1H09xdDLsKqaL
 aZa3fJW70tmebepZeP+/1mXc1Jeda/Quh2kH7WOkl5D5EicTJhA7F/e5l4SL1ZzDhT/RUiZnu7S
 XU0QpR4fsv+gUsrwbzu91Kc9lQmh6
X-Received: by 2002:a17:907:271b:b0:7ad:b748:63df with SMTP id
 w27-20020a170907271b00b007adb74863dfmr49408586ejk.639.1667899016445; 
 Tue, 08 Nov 2022 01:16:56 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4Xr+gXGl/lXUSrVkCOP+x+VQ6afrCBXL2snos3AnDyBBa7/+RCp4rPgaCY+vB1ADWXw7S1kw==
X-Received: by 2002:a17:907:271b:b0:7ad:b748:63df with SMTP id
 w27-20020a170907271b00b007adb74863dfmr49408579ejk.639.1667899016288; 
 Tue, 08 Nov 2022 01:16:56 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 hg11-20020a1709072ccb00b007a8de84ce36sm4369139ejc.206.2022.11.08.01.16.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 01:16:55 -0800 (PST)
Message-ID: <68082c10-31e1-dc00-7cba-13659d5cd95d@redhat.com>
Date: Tue, 8 Nov 2022 10:16:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add quirk for Nanote
 UMPC-01
To: Simon Ser <contact@emersion.fr>
References: <20220919133258.711639-1-hdegoede@redhat.com>
 <26aEQcP_ViYtKVyckwJ8dtLn-k76hwJDpZtmNZYl_7V6FVlzfPYclnxUsgq2m5FgfxVzqoR4u3CO0nBdqBgql71KvqJrj74f8fr4ba4Ojmk=@emersion.fr>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <26aEQcP_ViYtKVyckwJ8dtLn-k76hwJDpZtmNZYl_7V6FVlzfPYclnxUsgq2m5FgfxVzqoR4u3CO0nBdqBgql71KvqJrj74f8fr4ba4Ojmk=@emersion.fr>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/7/22 17:25, Simon Ser wrote:
> Acked-by: Simon Ser <contact@emersion.fr>

Thank you. I've pushed both patches to drm-misc-fixes now.

Regards,

Hans


