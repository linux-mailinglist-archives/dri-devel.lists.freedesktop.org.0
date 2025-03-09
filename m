Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BBAA5804F
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 03:28:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194B010E2E3;
	Sun,  9 Mar 2025 02:28:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="aYLeKpPj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199A810E2E3
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 02:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1741487301; x=1742092101; i=deller@gmx.de;
 bh=b2MUapp1D8zy3Ec40S7ikFXYXwwoSCT8736UppSJRik=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=aYLeKpPj+D9P/fnbGrd3j/ycXwLhLk0GfYvnwijv3f+4Jyg581m8zkO9oN4ec/aS
 FRDzKmseONU65OBTa9GdlWSdvQWlfh+tsOfsA5XWDaMplhsPBq0w3xU3O1aksrK6O
 nz4W0/KLFy42otZLMi4mYrfvF6WrZCrB9BYvlFxL5cThycTABuJK9ZmvFgg5jK+cS
 CE8hOW5Bqj9ZpCxtwm4OtWbRnNCvQSroLaqwwbo8AsZqqNzhZQOP+tcjbBW5ZQbjw
 i92OBSOc6efcVth9+MeTOhzq4iT9IzzsAf4mrp91V3uXy41DLlShOIXa8oNxJg43v
 QswdObHKao2u5v9CMg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.121]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mk0JM-1tOK6P16Eq-00ikTl; Sun, 09
 Mar 2025 03:28:21 +0100
Message-ID: <91f20115-5579-4915-8dcd-b6b332ec73ee@gmx.de>
Date: Sun, 9 Mar 2025 03:28:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: fsl-diu-fb: add missing device_remove_file()
To: oushixiong1025@163.com, Timur Tabi <timur@kernel.org>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
References: <20250208102359.279333-1-oushixiong1025@163.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250208102359.279333-1-oushixiong1025@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:St5+9oElqOxix1PHr4neUE832p8VH2NQION9EV5UJ/v3UYBMVo8
 QBffN7YopHCQ2Pa/cIyWfnozlggOG8vnEgg6K761ooH0K3hYEQRFS04AjEI4m5OU6Cp6s9z
 zyyyilXiLBBJPt+sCyqBruXTU3T9bZ6qmtP1ZdytgJJGzTo4DMeiclQvYbEFjbVoVQdJoBh
 +xHqPqfXvl+MzPngJ1TLw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:B2zENpV3T7c=;JFVMLcivJw93Vi6ENQD+4CcifUZ
 4OnlCXAqOpJUofDVsoK0ZCNteiZBF67qXeUCZmM3gdN4wbwzSs+PMmUmUcIQL++7KFHZUpcTj
 7lFgLxeB6SY9dO8WJ0cvOkBSGcw5Cl5jsY0ww+K1ztQbxoNdmnbJL7o7HJqySHHkfoP/NFXTb
 YoHJ7vVWjWNeI1CftdnyFlHOUeJ0xxDvO3pz5FW6ooqDymYsv+GvKnL8kJkj8YVnCKhla2kPa
 +0VNVVs2i2atKFgoid91dBkKG+NYTJuhFFJ9kU0l8nuVEq0ppARYdlHvu4CKO1MwXm5K3KF0E
 54JFGN/qCNw5oY4TSkZnM7SalYRjVvufwLwCKeFBXAnanPKA6tkSTK6bjeYHNzKero4yo9AhP
 C7KXTcjLOD05rp3puOpGLTQnmEL0YR45+QqohYYAPTbaTk/qilmNdXo3USEF71vhEWBhIS+0x
 SbJITIl29BCXukr26kDMkylrXFCYVJ6uYGx+Oy7JlHKWvwVg+RgetOw4jXaPp74SHBHgFr968
 myjsaurg7uaQ4RGERyWZVZegveyNr7iKmd0r4xrJ+bVWQwseaGvy4iPpGDC8514Nju/TFaxyU
 oycwVbpLcwTBTr7UvhhYubVsVGh+r6Cujmi5xsaMYqIzjHxx3MWtUc2i5KfE+VVUkwn31CnYb
 13U6l5gP0o2tFqa3ObSFR50qgoUx/Si2mTr8CLrRqDEsL0lbAo4C1wQpOmoA5jpy2Y2vvb8uY
 76DW5YBjv0jkaa1VMgUk6M3imtzkVu9ZSuNCmdpMvuSq/h45nCWI6W9yhppglIqSwy09Xa15Q
 wRiiUassh2/+TpjDATg31CLvvI83rBkKi2cU8HY0JsTKydPRdPC+WQ1e6yiv7uDp0W/ul6Pzg
 6NeEf90YKqaXz4gNJAqHb0BCib37+plw25mnEbIiKgxGwtYmCOtALK06VwyAhA/ynJ5fz/jl+
 GMHQqnQP3hRm+CAJsBQFygcVpi9vEXlLEo91TfOXpQ2hMqmzAIzvuOezQJ9xkDilDqkQP35VI
 xH/HWjILZaQbXNmUQWpWYfeiqE1QVGwPMwNtNbyEC4FaedFejng2gyX327LoQAKaIatOOGYCT
 1Vxf00Blh+dsL6dKa9ASPfoku+oG3FPVMWQibt84JoKtn25eDMnwD7qHc+xYMSzPwHoVa7fq2
 usZzrNkiKqbeV+u8riUHJcj7yPH+1Q1FdwEJGhqwFel8GFUuf64gsNKGfDfor4Zdm76E/ex0l
 ELGDGJXPLVWWEIQwlpch4FM9W+rFXilR7sBLzQDDrPZHNM2ytqOxdXYE3aQ7mvaGi49U3U6Rr
 /JWEOH/yhvXQzyjsTB8J7wDYAw2laLbbwghfYfFaIc2AV1g2w0UY8CWWpSbOXPUC9SkqvYNnK
 5RuencfLeivwlYZRaomH/nCWkixLchV4ZPDvZ2LXdy+QD90PnyEBPc2MEI
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

On 2/8/25 11:23, oushixiong1025@163.com wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
>
> Call device_remove_file() when driver remove.
>
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> ---
>   drivers/video/fbdev/fsl-diu-fb.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/video/fbdev/fsl-diu-fb.c b/drivers/video/fbdev/fsl-=
diu-fb.c
> index 5ac8201c3533..8c91af9a9156 100644
> --- a/drivers/video/fbdev/fsl-diu-fb.c
> +++ b/drivers/video/fbdev/fsl-diu-fb.c
> @@ -1807,6 +1807,7 @@ static int fsl_diu_probe(struct platform_device *p=
dev)
>   	if (ret) {
>   		dev_err(&pdev->dev, "could not create sysfs file %s\n",
>   			data->dev_attr.attr.name);
> +		goto error;

this seems to miss calling free_irq() then at least...

Helge
