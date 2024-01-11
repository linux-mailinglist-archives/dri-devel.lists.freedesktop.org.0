Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCD482B12D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 15:59:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF3E10E941;
	Thu, 11 Jan 2024 14:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219ED10E96C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 14:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ggAhDQaqSSXS+RFUeCNyRkjVtZ1US5Ev8orbx1i1DT4=; b=J0sq/Om6DRGM2gHv6yDorXySW3
 SuHGW2TsL6y2nUqQ83nB4Pq8eAdYlDgOqZk5lK7A6JPM7KzcBwR6LaXPFAWDVIF3pzf1xsZ0NE2KU
 /84r0C6fbHx3rVajaPuy6Qo8L90IokDn/6AW35qaTmgn1HGJ+mJICgIgHoozw9Ycn/zapjinGVr+K
 dViXwtzPuUZGOFGph06r/RhXVfG2caiZboxhCTKtmsIN+SJEe5XGbxbrL3NZXrvN4GDuUW9SbxT2a
 MTUB2SGwZ1bVU2EpqdjYDYP69q5VYoaGNaKIutp9jmP16pLa23fWm9HmKh+NpkH499ObU1RhzSHok
 6aYsHvcA==;
Received: from [179.234.233.159] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rNwWW-005Qws-Lr; Thu, 11 Jan 2024 15:59:12 +0100
Message-ID: <1fa320f7-d37e-4820-a93a-99623fb9d938@igalia.com>
Date: Thu, 11 Jan 2024 11:59:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/v3d: Show the memory-management stats on debugfs
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>
References: <20240105145851.193492-1-mcanal@igalia.com>
 <raexpawp3v2tpyw7gwnxb6ijmohaw62odyspjigbulddny57ga@7mjwwheh5zca>
From: Maira Canal <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <raexpawp3v2tpyw7gwnxb6ijmohaw62odyspjigbulddny57ga@7mjwwheh5zca>
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
Cc: kernel-dev@igalia.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Iago Toral <itoral@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/5/24 12:32, Melissa Wen wrote:
> On 01/05, Maíra Canal wrote:
>> Dump the contents of the DRM MM allocator of the V3D driver. This will
>> help us to debug the VA ranges allocated.
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/v3d/v3d_debugfs.c | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_debugfs.c
>> index f843a50d5dce..cdfe1d3bf5ee 100644
>> --- a/drivers/gpu/drm/v3d/v3d_debugfs.c
>> +++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
>> @@ -260,11 +260,26 @@ static int v3d_measure_clock(struct seq_file *m, void *unused)
>>   	return 0;
>>   }
>>
>> +static int v3d_debugfs_mm(struct seq_file *m, void *unused)
>> +{
>> +	struct drm_printer p = drm_seq_file_printer(m);
>> +	struct drm_debugfs_entry *entry = m->private;
>> +	struct drm_device *dev = entry->dev;
>> +	struct v3d_dev *v3d = to_v3d_dev(dev);
>> +
>> +	spin_lock(&v3d->mm_lock);
>> +	drm_mm_print(&v3d->mm, &p);
>> +	spin_unlock(&v3d->mm_lock);
>> +
>> +	return 0;
>> +}
> 
> LGTM.
> 
> Reviewed-by: Melissa Wen <mwen@igalia.com>

Pushed to drm-misc/drm-misc-next!

Best Regards,
- Maíra

> 
>> +
>>   static const struct drm_debugfs_info v3d_debugfs_list[] = {
>>   	{"v3d_ident", v3d_v3d_debugfs_ident, 0},
>>   	{"v3d_regs", v3d_v3d_debugfs_regs, 0},
>>   	{"measure_clock", v3d_measure_clock, 0},
>>   	{"bo_stats", v3d_debugfs_bo_stats, 0},
>> +	{"v3d_mm", v3d_debugfs_mm, 0},
>>   };
>>
>>   void
>> --
>> 2.43.0
>>
