Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A527D53A3
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 16:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E73510E0B1;
	Tue, 24 Oct 2023 14:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8D910E0B1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 14:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Content-Type:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L1iTz6bfM1AQiG4Syo2PQTivr72mp0i/nRWFqT+0Y2k=; b=qA+R5vdmxrfVvRAHBmSpc6QoqG
 y4/83ft83MAoXB6rATilSmbgyH4cEq4Vq3zdbCr9KXoMjIUbygy3hp3+kWRshT2w4cVEvyQANBvi2
 rZJzp0EAqKzPFB5YKN1csApSz9LTGQ2fPPeNCGrPEZDH4T82fhC3hgecQ6haDA27/WeZH24mW1CB0
 Ouco2Wt8okKKMbFL7CW1L4Fz775Xr7fPj4f8lyihw95P7n+msz1AjxowQOmcWMOS2NKB6coga4lLh
 0dpXkQu40zlhwtI9DC1Hsak1PHgLn6Qh5VKRbCtNK5UUbN83q75Fwq/Ss8KPzk+k9buE48KqC/NNO
 kOg/fDlg==;
Received: from 7.33.165.83.dynamic.reverse-mundo-r.com ([83.165.33.7]
 helo=[192.168.50.15]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qvI3x-006VLO-88; Tue, 24 Oct 2023 16:07:17 +0200
Content-Type: multipart/alternative;
 boundary="------------CKpSsn4e0gMPeWLMP5pEJDmM"
Message-ID: <805445f7-0f4d-46c4-ac81-85eb4e7cab00@igalia.com>
Date: Tue, 24 Oct 2023 16:07:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] drm/v3d: Expose GPU usage stats
Content-Language: en-US
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>
References: <20230905213416.1290219-1-mcanal@igalia.com>
From: Chema Casanova <jmcasanova@igalia.com>
In-Reply-To: <20230905213416.1290219-1-mcanal@igalia.com>
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
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------CKpSsn4e0gMPeWLMP5pEJDmM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I've just tested this series, and it is working perfectly. For the two 
patches of the series:

Acked-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>

Thanks Maíra for taking care of upstreaming this feature.

Chema

El 5/9/23 a las 23:06, Maíra Canal escribió:
> This patchset exposes GPU usages stats both globally and per-file
> descriptor.
>
> The first patch exposes the accumulated amount of active time per client
> through the fdinfo infrastructure. The amount of active time is exposed
> for each V3D queue. Moreover, it exposes the number of jobs submitted to
> each queue.
>
> The second patch exposes the accumulated amount of active time for each
> V3D queue, independent of the client. This data is exposed through the
> sysfs interface.
>
> With these patches, it is possible to calculate the GPU usage percentage
> per queue globally and per-file descriptor.
>
> * Example fdinfo output:
>
> $ cat /proc/1140/fdinfo/4
> pos:    0
> flags:  02400002
> mnt_id: 24
> ino:    209
> drm-driver:     v3d
> drm-client-id:  44
> drm-engine-bin:         1661076898 ns
> v3d-jobs-bin:   19576 jobs
> drm-engine-render:      31469427170 ns
> v3d-jobs-render:        19575 jobs
> drm-engine-tfu:         5002964 ns
> v3d-jobs-tfu:   13 jobs
> drm-engine-csd:         188038329691 ns
> v3d-jobs-csd:   250393 jobs
> drm-engine-cache_clean:         27736024038 ns
> v3d-jobs-cache_clean:   250392 job
>
> * Example gputop output:
>
> DRM minor 128
>   PID         bin               render               tfu                csd            cache_clean     NAME
> 1140 |▎                ||██▋               ||                 ||█████████████▍   ||█▋               | computecloth
> 1158 |▍                ||████████▉         ||                 ||                 ||                 | gears
> 1002 |▏                ||█▎                ||                 ||                 ||                 | chromium-browse
>
> Best Regards,
> - Maíra
>
> ---
>
> v1 -> v2:https://lore.kernel.org/dri-devel/20230727142929.1275149-1-mcanal@igalia.com/T/
>
> * Use sysfs to expose global GPU stats (Tvrtko Ursulin)
>
> v2 -> v3:https://lore.kernel.org/dri-devel/20230807211849.49867-1-mcanal@igalia.com/T/
>
> * Document the expected behavior in case of a GPU reset (Melissa Wen)
> * Add a brief description about the sysfs outputs (Melissa Wen)
> * Instead of having multiple sysfs files, use only one sysfs file,
>    called gpu_stats, with all the information (Chema Casanova)
> * Add the number of jobs submitted in the global GPU stats (Chema Casanova)
> * Now, the number of jobs submitted is only incremented if the job was
>    completed
>
> Maíra Canal (2):
>    drm/v3d: Implement show_fdinfo() callback for GPU usage stats
>    drm/v3d: Expose the total GPU usage stats on sysfs
>
>   drivers/gpu/drm/v3d/Makefile    |  3 +-
>   drivers/gpu/drm/v3d/v3d_drv.c   | 45 ++++++++++++++++++++-
>   drivers/gpu/drm/v3d/v3d_drv.h   | 31 +++++++++++++++
>   drivers/gpu/drm/v3d/v3d_gem.c   |  7 +++-
>   drivers/gpu/drm/v3d/v3d_irq.c   | 49 +++++++++++++++++++++++
>   drivers/gpu/drm/v3d/v3d_sched.c | 33 ++++++++++++++++
>   drivers/gpu/drm/v3d/v3d_sysfs.c | 69 +++++++++++++++++++++++++++++++++
>   7 files changed, 234 insertions(+), 3 deletions(-)
>   create mode 100644 drivers/gpu/drm/v3d/v3d_sysfs.c
>
> --
> 2.41.0
>
>
--------------CKpSsn4e0gMPeWLMP5pEJDmM
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html data-lt-installed="true">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body style="padding-bottom: 1px;">
    <p>I've just tested this series, and it is working perfectly. For
      the two patches of the series:<br>
    </p>
    <p>Acked-by: Jose Maria Casanova Crespo
      <a class="moz-txt-link-rfc2396E" href="mailto:jmcasanova@igalia.com">&lt;jmcasanova@igalia.com&gt;</a></p>
    <p>Thanks Maíra for taking care of upstreaming this feature.</p>
    <p>Chema<br>
    </p>
    <div class="moz-cite-prefix">El 5/9/23 a las 23:06, Maíra Canal
      escribió:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230905213416.1290219-1-mcanal@igalia.com">
      <pre class="moz-quote-pre" wrap="">This patchset exposes GPU usages stats both globally and per-file
descriptor.

The first patch exposes the accumulated amount of active time per client
through the fdinfo infrastructure. The amount of active time is exposed
for each V3D queue. Moreover, it exposes the number of jobs submitted to
each queue.

The second patch exposes the accumulated amount of active time for each
V3D queue, independent of the client. This data is exposed through the
sysfs interface.

With these patches, it is possible to calculate the GPU usage percentage
per queue globally and per-file descriptor.

* Example fdinfo output:

$ cat /proc/1140/fdinfo/4
pos:    0
flags:  02400002
mnt_id: 24
ino:    209
drm-driver:     v3d
drm-client-id:  44
drm-engine-bin:         1661076898 ns
v3d-jobs-bin:   19576 jobs
drm-engine-render:      31469427170 ns
v3d-jobs-render:        19575 jobs
drm-engine-tfu:         5002964 ns
v3d-jobs-tfu:   13 jobs
drm-engine-csd:         188038329691 ns
v3d-jobs-csd:   250393 jobs
drm-engine-cache_clean:         27736024038 ns
v3d-jobs-cache_clean:   250392 job

* Example gputop output:

DRM minor 128
 PID         bin               render               tfu                csd            cache_clean     NAME
1140 |▎                ||██▋               ||                 ||█████████████▍   ||█▋               | computecloth
1158 |▍                ||████████▉         ||                 ||                 ||                 | gears
1002 |▏                ||█▎                ||                 ||                 ||                 | chromium-browse

Best Regards,
- Maíra

---

v1 -&gt; v2: <a class="moz-txt-link-freetext" href="https://lore.kernel.org/dri-devel/20230727142929.1275149-1-mcanal@igalia.com/T/">https://lore.kernel.org/dri-devel/20230727142929.1275149-1-mcanal@igalia.com/T/</a>

* Use sysfs to expose global GPU stats (Tvrtko Ursulin)

v2 -&gt; v3: <a class="moz-txt-link-freetext" href="https://lore.kernel.org/dri-devel/20230807211849.49867-1-mcanal@igalia.com/T/">https://lore.kernel.org/dri-devel/20230807211849.49867-1-mcanal@igalia.com/T/</a>

* Document the expected behavior in case of a GPU reset (Melissa Wen)
* Add a brief description about the sysfs outputs (Melissa Wen)
* Instead of having multiple sysfs files, use only one sysfs file,
  called gpu_stats, with all the information (Chema Casanova)
* Add the number of jobs submitted in the global GPU stats (Chema Casanova)
* Now, the number of jobs submitted is only incremented if the job was
  completed

Maíra Canal (2):
  drm/v3d: Implement show_fdinfo() callback for GPU usage stats
  drm/v3d: Expose the total GPU usage stats on sysfs

 drivers/gpu/drm/v3d/Makefile    |  3 +-
 drivers/gpu/drm/v3d/v3d_drv.c   | 45 ++++++++++++++++++++-
 drivers/gpu/drm/v3d/v3d_drv.h   | 31 +++++++++++++++
 drivers/gpu/drm/v3d/v3d_gem.c   |  7 +++-
 drivers/gpu/drm/v3d/v3d_irq.c   | 49 +++++++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_sched.c | 33 ++++++++++++++++
 drivers/gpu/drm/v3d/v3d_sysfs.c | 69 +++++++++++++++++++++++++++++++++
 7 files changed, 234 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/v3d/v3d_sysfs.c

--
2.41.0


</pre>
    </blockquote>
  </body>
  <lt-container></lt-container>
</html>

--------------CKpSsn4e0gMPeWLMP5pEJDmM--
