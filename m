Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3676F27E41
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 15:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE85289E43;
	Thu, 23 May 2019 13:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B0089E3B;
 Thu, 23 May 2019 13:37:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 May 2019 06:37:42 -0700
X-ExtLoop1: 1
Received: from delly.ld.intel.com (HELO [10.103.238.204]) ([10.103.238.204])
 by fmsmga008.fm.intel.com with ESMTP; 23 May 2019 06:37:41 -0700
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/syncobj: add an output syncobj
 parameter to find_fence
To: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20190523114620.19335-1-lionel.g.landwerlin@intel.com>
 <20190523114620.19335-2-lionel.g.landwerlin@intel.com>
 <-puwqkvl1kf9u-b7x3md-nw9l5d8fjhc1-57ay9i80p3ne5zfq-v36laytxxssb-707g2imrn1o7-kvonq5nbuaig-6dlanc9wrlar1w0zlrxn0apu-qaxsb6-ac864zux0f2o3d8y3zq369i3-f7fg8.1558613478804@email.android.com>
 <fc0c95ca-f500-f2e2-2011-82c43e9c18e0@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <03b1e03c-182c-becf-5f85-bb49650517b8@intel.com>
Date: Thu, 23 May 2019 14:37:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <fc0c95ca-f500-f2e2-2011-82c43e9c18e0@intel.com>
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>,
 DRI-Devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0929679270=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0929679270==
Content-Type: multipart/alternative;
 boundary="------------3DE8C6EE096361AED4B70F8C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------3DE8C6EE096361AED4B70F8C
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

I should mentioned that this is going to make the find_fence() function 
a fair bit more complex :)

On 23/05/2019 14:35, Lionel Landwerlin wrote:
> Sure
>
> -Lionel
>
> On 23/05/2019 13:11, Zhou, David(ChunMing) wrote:
>> can you make the parameter optional? Otherwise looks good to me.
>>
>> -David
>>
>> -------- Original Message --------
>> Subject: [PATCH 1/2] drm/syncobj: add an output syncobj parameter to 
>> find_fence
>> From: Lionel Landwerlin
>> To: intel-gfx@lists.freedesktop.org
>> CC: Lionel Landwerlin ,"Koenig, Christian" ,"Zhou, David(ChunMing)" 
>> ,Eric Anholt ,DRI-Devel
>>
>> [CAUTION: External Email]
>>
>> We would like to get both the fence & the syncobj in i915 rather than
>> doing 2 calls to drm_syncobj_find() & drm_syncobj_find_fence().
>>
>> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>> Cc: Christian Koenig <Christian.Koenig@amd.com>
>> Cc: David(ChunMing) Zhou <David1.Zhou@amd.com>
>> Cc: Eric Anholt <eric@anholt.net>
>> CC: DRI-Devel <dri-devel@lists.freedesktop.org>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c |  4 ++-
>>  drivers/gpu/drm/drm_syncobj.c          | 45 +++++++++++++++++---------
>>  drivers/gpu/drm/v3d/v3d_gem.c          |  5 ++-
>>  include/drm/drm_syncobj.h              |  1 +
>>  4 files changed, 38 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> index 2f6239b6be6f..09fde3c73a2c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> @@ -1124,10 +1124,11 @@ static int 
>> amdgpu_syncobj_lookup_and_add_to_sync(struct amdgpu_cs_parser *p,
>>                                                  uint32_t handle, u64 
>> point,
>>                                                  u64 flags)
>>  {
>> +       struct drm_syncobj *syncobj;
>>         struct dma_fence *fence;
>>         int r;
>>
>> -       r = drm_syncobj_find_fence(p->filp, handle, point, flags, 
>> &fence);
>> +       r = drm_syncobj_find_fence(p->filp, handle, point, flags, 
>> &syncobj, &fence);
>>         if (r) {
>>                 DRM_ERROR("syncobj %u failed to find fence @ %llu 
>> (%d)!\n",
>>                           handle, point, r);
>> @@ -1136,6 +1137,7 @@ static int 
>> amdgpu_syncobj_lookup_and_add_to_sync(struct amdgpu_cs_parser *p,
>>
>>         r = amdgpu_sync_fence(p->adev, &p->job->sync, fence, true);
>>         dma_fence_put(fence);
>> +       drm_syncobj_put(syncobj);
>>
>>         return r;
>>  }
>> diff --git a/drivers/gpu/drm/drm_syncobj.c 
>> b/drivers/gpu/drm/drm_syncobj.c
>> index 3d400905100b..f2fd0c1fb1d3 100644
>> --- a/drivers/gpu/drm/drm_syncobj.c
>> +++ b/drivers/gpu/drm/drm_syncobj.c
>> @@ -222,29 +222,32 @@ static void 
>> drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
>>   * @handle: sync object handle to lookup.
>>   * @point: timeline point
>>   * @flags: DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT or not
>> + * @syncobj: out parameter for the syncobj
>>   * @fence: out parameter for the fence
>>   *
>>   * This is just a convenience function that combines 
>> drm_syncobj_find() and
>>   * drm_syncobj_fence_get().
>>   *
>> - * Returns 0 on success or a negative error value on failure. On 
>> success @fence
>> - * contains a reference to the fence, which must be released by calling
>> - * dma_fence_put().
>> + * Returns 0 on success or a negative error value on failure. On
>> + * success @syncobj and @fence contains a reference respectively to
>> + * the syncobj and to the fence, which must be released by calling
>> + * respectively drm_syncobj_put() and dma_fence_put().
>>   */
>>  int drm_syncobj_find_fence(struct drm_file *file_private,
>>                            u32 handle, u64 point, u64 flags,
>> +                          struct drm_syncobj **syncobj,
>>                            struct dma_fence **fence)
>>  {
>> -       struct drm_syncobj *syncobj = drm_syncobj_find(file_private, 
>> handle);
>>         struct syncobj_wait_entry wait;
>>         u64 timeout = 
>> nsecs_to_jiffies64(DRM_SYNCOBJ_WAIT_FOR_SUBMIT_TIMEOUT);
>>         int ret;
>>
>> -       if (!syncobj)
>> +       *syncobj = drm_syncobj_find(file_private, handle);
>> +
>> +       if (!(*syncobj))
>>                 return -ENOENT;
>>
>> -       *fence = drm_syncobj_fence_get(syncobj);
>> -       drm_syncobj_put(syncobj);
>> +       *fence = drm_syncobj_fence_get(*syncobj);
>>
>>         if (*fence) {
>>                 ret = dma_fence_chain_find_seqno(fence, point);
>> @@ -255,13 +258,15 @@ int drm_syncobj_find_fence(struct drm_file 
>> *file_private,
>>                 ret = -EINVAL;
>>         }
>>
>> -       if (!(flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT))
>> +       if (!(flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT)) {
>> +               drm_syncobj_put(*syncobj);
>>                 return ret;
>> +       }
>>
>>         memset(&wait, 0, sizeof(wait));
>>         wait.task = current;
>>         wait.point = point;
>> -       drm_syncobj_fence_add_wait(syncobj, &wait);
>> +       drm_syncobj_fence_add_wait(*syncobj, &wait);
>>
>>         do {
>>                 set_current_state(TASK_INTERRUPTIBLE);
>> @@ -286,7 +291,10 @@ int drm_syncobj_find_fence(struct drm_file 
>> *file_private,
>>         *fence = wait.fence;
>>
>>         if (wait.node.next)
>> -               drm_syncobj_remove_wait(syncobj, &wait);
>> +               drm_syncobj_remove_wait(*syncobj, &wait);
>> +
>> +       if (ret)
>> +               drm_syncobj_put(*syncobj);
>>
>>         return ret;
>>  }
>> @@ -531,6 +539,7 @@ static int drm_syncobj_export_sync_file(struct 
>> drm_file *file_private,
>>                                         int handle, int *p_fd)
>>  {
>>         int ret;
>> +       struct drm_syncobj *syncobj;
>>         struct dma_fence *fence;
>>         struct sync_file *sync_file;
>>         int fd = get_unused_fd_flags(O_CLOEXEC);
>> @@ -538,13 +547,14 @@ static int drm_syncobj_export_sync_file(struct 
>> drm_file *file_private,
>>         if (fd < 0)
>>                 return fd;
>>
>> -       ret = drm_syncobj_find_fence(file_private, handle, 0, 0, &fence);
>> +       ret = drm_syncobj_find_fence(file_private, handle, 0, 0, 
>> &syncobj, &fence);
>>         if (ret)
>>                 goto err_put_fd;
>>
>>         sync_file = sync_file_create(fence);
>>
>>         dma_fence_put(fence);
>> +       drm_syncobj_put(syncobj);
>>
>>         if (!sync_file) {
>>                 ret = -EINVAL;
>> @@ -682,7 +692,8 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device 
>> *dev, void *data,
>>  static int drm_syncobj_transfer_to_timeline(struct drm_file 
>> *file_private,
>>                                             struct 
>> drm_syncobj_transfer *args)
>>  {
>> -       struct drm_syncobj *timeline_syncobj = NULL;
>> +       struct drm_syncobj *timeline_syncobj;
>> +       struct drm_syncobj *src_syncobj;
>>         struct dma_fence *fence;
>>         struct dma_fence_chain *chain;
>>         int ret;
>> @@ -693,7 +704,7 @@ static int 
>> drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
>>         }
>>         ret = drm_syncobj_find_fence(file_private, args->src_handle,
>>                                      args->src_point, args->flags,
>> -                                    &fence);
>> +                                    &src_syncobj, &fence);
>>         if (ret)
>>                 goto err;
>>         chain = kzalloc(sizeof(struct dma_fence_chain), GFP_KERNEL);
>> @@ -704,6 +715,7 @@ static int 
>> drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
>>         drm_syncobj_add_point(timeline_syncobj, chain, fence, 
>> args->dst_point);
>>  err1:
>>         dma_fence_put(fence);
>> +       drm_syncobj_put(src_syncobj);
>>  err:
>>         drm_syncobj_put(timeline_syncobj);
>>
>> @@ -714,7 +726,8 @@ static int
>>  drm_syncobj_transfer_to_binary(struct drm_file *file_private,
>>                                struct drm_syncobj_transfer *args)
>>  {
>> -       struct drm_syncobj *binary_syncobj = NULL;
>> +       struct drm_syncobj *binary_syncobj;
>> +       struct drm_syncobj *src_syncobj;
>>         struct dma_fence *fence;
>>         int ret;
>>
>> @@ -722,11 +735,13 @@ drm_syncobj_transfer_to_binary(struct drm_file 
>> *file_private,
>>         if (!binary_syncobj)
>>                 return -ENOENT;
>>         ret = drm_syncobj_find_fence(file_private, args->src_handle,
>> -                                    args->src_point, args->flags, 
>> &fence);
>> +                                    args->src_point, args->flags,
>> +                                    &src_syncobj, &fence);
>>         if (ret)
>>                 goto err;
>>         drm_syncobj_replace_fence(binary_syncobj, fence);
>>         dma_fence_put(fence);
>> +       drm_syncobj_put(src_syncobj);
>>  err:
>>         drm_syncobj_put(binary_syncobj);
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c 
>> b/drivers/gpu/drm/v3d/v3d_gem.c
>> index 27e0f87075d9..26bd3a2e39ca 100644
>> --- a/drivers/gpu/drm/v3d/v3d_gem.c
>> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
>> @@ -431,6 +431,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file 
>> *file_priv,
>>              struct v3d_job *job, void (*free)(struct kref *ref),
>>              u32 in_sync)
>>  {
>> +       struct drm_syncobj *in_syncobj = NULL;
>>         struct dma_fence *in_fence = NULL;
>>         int ret;
>>
>> @@ -443,10 +444,12 @@ v3d_job_init(struct v3d_dev *v3d, struct 
>> drm_file *file_priv,
>>
>>         xa_init_flags(&job->deps, XA_FLAGS_ALLOC);
>>
>> -       ret = drm_syncobj_find_fence(file_priv, in_sync, 0, 0, 
>> &in_fence);
>> +       ret = drm_syncobj_find_fence(file_priv, in_sync, 0, 0, 
>> &syncobj, &in_fence);
>>         if (ret == -EINVAL)
>>                 goto fail;
>>
>> +       drm_syncobj_put(in_sync);
>> +
>>         ret = drm_gem_fence_array_add(&job->deps, in_fence);
>>         if (ret)
>>                 goto fail;
>> diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
>> index 6cf7243a1dc5..08eca690f783 100644
>> --- a/include/drm/drm_syncobj.h
>> +++ b/include/drm/drm_syncobj.h
>> @@ -121,6 +121,7 @@ void drm_syncobj_replace_fence(struct drm_syncobj 
>> *syncobj,
>>                                struct dma_fence *fence);
>>  int drm_syncobj_find_fence(struct drm_file *file_private,
>>                            u32 handle, u64 point, u64 flags,
>> +                          struct drm_syncobj **syncobj,
>>                            struct dma_fence **fence);
>>  void drm_syncobj_free(struct kref *kref);
>>  int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
>> --
>> 2.21.0.392.gf8f6787159e
>>
>
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx



--------------3DE8C6EE096361AED4B70F8C
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">I should mentioned that this is going
      to make the find_fence() function a fair bit more complex :)<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 23/05/2019 14:35, Lionel Landwerlin
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:fc0c95ca-f500-f2e2-2011-82c43e9c18e0@intel.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <div class="moz-cite-prefix">Sure</div>
      <div class="moz-cite-prefix"><br>
      </div>
      <div class="moz-cite-prefix">-Lionel<br>
      </div>
      <div class="moz-cite-prefix"><br>
      </div>
      <div class="moz-cite-prefix">On 23/05/2019 13:11, Zhou,
        David(ChunMing) wrote:<br>
      </div>
      <blockquote type="cite"
cite="mid:-puwqkvl1kf9u-b7x3md-nw9l5d8fjhc1-57ay9i80p3ne5zfq-v36laytxxssb-707g2imrn1o7-kvonq5nbuaig-6dlanc9wrlar1w0zlrxn0apu-qaxsb6-ac864zux0f2o3d8y3zq369i3-f7fg8.1558613478804@email.android.com">
        <meta name="Generator" content="Microsoft Exchange Server">
        <!-- converted from text -->
        <style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left: #800000 2px solid; } --></style>
        <div>can you make the parameter optional? Otherwise looks good
          to me.<br>
          <br>
          -David<br>
          <br>
          -------- Original Message --------<br>
          Subject: [PATCH 1/2] drm/syncobj: add an output syncobj
          parameter to find_fence<br>
          From: Lionel Landwerlin <br>
          To: <a class="moz-txt-link-abbreviated"
            href="mailto:intel-gfx@lists.freedesktop.org"
            moz-do-not-send="true">intel-gfx@lists.freedesktop.org</a><br>
          CC: Lionel Landwerlin ,"Koenig, Christian" ,"Zhou,
          David(ChunMing)" ,Eric Anholt ,DRI-Devel <br>
          <br>
        </div>
        <font size="2"><span style="font-size:11pt;">
            <div class="PlainText">[CAUTION: External Email]<br>
              <br>
              We would like to get both the fence &amp; the syncobj in
              i915 rather than<br>
              doing 2 calls to drm_syncobj_find() &amp;
              drm_syncobj_find_fence().<br>
              <br>
              Signed-off-by: Lionel Landwerlin <a
                class="moz-txt-link-rfc2396E"
                href="mailto:lionel.g.landwerlin@intel.com"
                moz-do-not-send="true">&lt;lionel.g.landwerlin@intel.com&gt;</a><br>
              Cc: Christian Koenig <a class="moz-txt-link-rfc2396E"
                href="mailto:Christian.Koenig@amd.com"
                moz-do-not-send="true">&lt;Christian.Koenig@amd.com&gt;</a><br>
              Cc: David(ChunMing) Zhou <a class="moz-txt-link-rfc2396E"
                href="mailto:David1.Zhou@amd.com" moz-do-not-send="true">&lt;David1.Zhou@amd.com&gt;</a><br>
              Cc: Eric Anholt <a class="moz-txt-link-rfc2396E"
                href="mailto:eric@anholt.net" moz-do-not-send="true">&lt;eric@anholt.net&gt;</a><br>
              CC: DRI-Devel <a class="moz-txt-link-rfc2396E"
                href="mailto:dri-devel@lists.freedesktop.org"
                moz-do-not-send="true">&lt;dri-devel@lists.freedesktop.org&gt;</a><br>
              ---<br>
               drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c |  4 ++-<br>
               drivers/gpu/drm/drm_syncobj.c          | 45
              +++++++++++++++++---------<br>
               drivers/gpu/drm/v3d/v3d_gem.c          |  5 ++-<br>
               include/drm/drm_syncobj.h              |  1 +<br>
               4 files changed, 38 insertions(+), 17 deletions(-)<br>
              <br>
              diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
              b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c<br>
              index 2f6239b6be6f..09fde3c73a2c 100644<br>
              --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c<br>
              +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c<br>
              @@ -1124,10 +1124,11 @@ static int
              amdgpu_syncobj_lookup_and_add_to_sync(struct
              amdgpu_cs_parser *p,<br>
                                                               uint32_t
              handle, u64 point,<br>
                                                               u64
              flags)<br>
               {<br>
              +       struct drm_syncobj *syncobj;<br>
                      struct dma_fence *fence;<br>
                      int r;<br>
              <br>
              -       r = drm_syncobj_find_fence(p-&gt;filp, handle,
              point, flags, &amp;fence);<br>
              +       r = drm_syncobj_find_fence(p-&gt;filp, handle,
              point, flags, &amp;syncobj, &amp;fence);<br>
                      if (r) {<br>
                              DRM_ERROR("syncobj %u failed to find fence
              @ %llu (%d)!\n",<br>
                                        handle, point, r);<br>
              @@ -1136,6 +1137,7 @@ static int
              amdgpu_syncobj_lookup_and_add_to_sync(struct
              amdgpu_cs_parser *p,<br>
              <br>
                      r = amdgpu_sync_fence(p-&gt;adev,
              &amp;p-&gt;job-&gt;sync, fence, true);<br>
                      dma_fence_put(fence);<br>
              +       drm_syncobj_put(syncobj);<br>
              <br>
                      return r;<br>
               }<br>
              diff --git a/drivers/gpu/drm/drm_syncobj.c
              b/drivers/gpu/drm/drm_syncobj.c<br>
              index 3d400905100b..f2fd0c1fb1d3 100644<br>
              --- a/drivers/gpu/drm/drm_syncobj.c<br>
              +++ b/drivers/gpu/drm/drm_syncobj.c<br>
              @@ -222,29 +222,32 @@ static void
              drm_syncobj_assign_null_handle(struct drm_syncobj
              *syncobj)<br>
                * @handle: sync object handle to lookup.<br>
                * @point: timeline point<br>
                * @flags: DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT or not<br>
              + * @syncobj: out parameter for the syncobj<br>
                * @fence: out parameter for the fence<br>
                *<br>
                * This is just a convenience function that combines
              drm_syncobj_find() and<br>
                * drm_syncobj_fence_get().<br>
                *<br>
              - * Returns 0 on success or a negative error value on
              failure. On success @fence<br>
              - * contains a reference to the fence, which must be
              released by calling<br>
              - * dma_fence_put().<br>
              + * Returns 0 on success or a negative error value on
              failure. On<br>
              + * success @syncobj and @fence contains a reference
              respectively to<br>
              + * the syncobj and to the fence, which must be released
              by calling<br>
              + * respectively drm_syncobj_put() and dma_fence_put().<br>
                */<br>
               int drm_syncobj_find_fence(struct drm_file *file_private,<br>
                                         u32 handle, u64 point, u64
              flags,<br>
              +                          struct drm_syncobj **syncobj,<br>
                                         struct dma_fence **fence)<br>
               {<br>
              -       struct drm_syncobj *syncobj =
              drm_syncobj_find(file_private, handle);<br>
                      struct syncobj_wait_entry wait;<br>
                      u64 timeout =
              nsecs_to_jiffies64(DRM_SYNCOBJ_WAIT_FOR_SUBMIT_TIMEOUT);<br>
                      int ret;<br>
              <br>
              -       if (!syncobj)<br>
              +       *syncobj = drm_syncobj_find(file_private, handle);<br>
              +<br>
              +       if (!(*syncobj))<br>
                              return -ENOENT;<br>
              <br>
              -       *fence = drm_syncobj_fence_get(syncobj);<br>
              -       drm_syncobj_put(syncobj);<br>
              +       *fence = drm_syncobj_fence_get(*syncobj);<br>
              <br>
                      if (*fence) {<br>
                              ret = dma_fence_chain_find_seqno(fence,
              point);<br>
              @@ -255,13 +258,15 @@ int drm_syncobj_find_fence(struct
              drm_file *file_private,<br>
                              ret = -EINVAL;<br>
                      }<br>
              <br>
              -       if (!(flags &amp;
              DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT))<br>
              +       if (!(flags &amp;
              DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT)) {<br>
              +               drm_syncobj_put(*syncobj);<br>
                              return ret;<br>
              +       }<br>
              <br>
                      memset(&amp;wait, 0, sizeof(wait));<br>
                      wait.task = current;<br>
                      wait.point = point;<br>
              -       drm_syncobj_fence_add_wait(syncobj, &amp;wait);<br>
              +       drm_syncobj_fence_add_wait(*syncobj, &amp;wait);<br>
              <br>
                      do {<br>
                              set_current_state(TASK_INTERRUPTIBLE);<br>
              @@ -286,7 +291,10 @@ int drm_syncobj_find_fence(struct
              drm_file *file_private,<br>
                      *fence = wait.fence;<br>
              <br>
                      if (wait.node.next)<br>
              -               drm_syncobj_remove_wait(syncobj,
              &amp;wait);<br>
              +               drm_syncobj_remove_wait(*syncobj,
              &amp;wait);<br>
              +<br>
              +       if (ret)<br>
              +               drm_syncobj_put(*syncobj);<br>
              <br>
                      return ret;<br>
               }<br>
              @@ -531,6 +539,7 @@ static int
              drm_syncobj_export_sync_file(struct drm_file
              *file_private,<br>
                                                      int handle, int
              *p_fd)<br>
               {<br>
                      int ret;<br>
              +       struct drm_syncobj *syncobj;<br>
                      struct dma_fence *fence;<br>
                      struct sync_file *sync_file;<br>
                      int fd = get_unused_fd_flags(O_CLOEXEC);<br>
              @@ -538,13 +547,14 @@ static int
              drm_syncobj_export_sync_file(struct drm_file
              *file_private,<br>
                      if (fd &lt; 0)<br>
                              return fd;<br>
              <br>
              -       ret = drm_syncobj_find_fence(file_private, handle,
              0, 0, &amp;fence);<br>
              +       ret = drm_syncobj_find_fence(file_private, handle,
              0, 0, &amp;syncobj, &amp;fence);<br>
                      if (ret)<br>
                              goto err_put_fd;<br>
              <br>
                      sync_file = sync_file_create(fence);<br>
              <br>
                      dma_fence_put(fence);<br>
              +       drm_syncobj_put(syncobj);<br>
              <br>
                      if (!sync_file) {<br>
                              ret = -EINVAL;<br>
              @@ -682,7 +692,8 @@ drm_syncobj_fd_to_handle_ioctl(struct
              drm_device *dev, void *data,<br>
               static int drm_syncobj_transfer_to_timeline(struct
              drm_file *file_private,<br>
                                                          struct
              drm_syncobj_transfer *args)<br>
               {<br>
              -       struct drm_syncobj *timeline_syncobj = NULL;<br>
              +       struct drm_syncobj *timeline_syncobj;<br>
              +       struct drm_syncobj *src_syncobj;<br>
                      struct dma_fence *fence;<br>
                      struct dma_fence_chain *chain;<br>
                      int ret;<br>
              @@ -693,7 +704,7 @@ static int
              drm_syncobj_transfer_to_timeline(struct drm_file
              *file_private,<br>
                      }<br>
                      ret = drm_syncobj_find_fence(file_private,
              args-&gt;src_handle,<br>
                                                   args-&gt;src_point,
              args-&gt;flags,<br>
              -                                    &amp;fence);<br>
              +                                    &amp;src_syncobj,
              &amp;fence);<br>
                      if (ret)<br>
                              goto err;<br>
                      chain = kzalloc(sizeof(struct dma_fence_chain),
              GFP_KERNEL);<br>
              @@ -704,6 +715,7 @@ static int
              drm_syncobj_transfer_to_timeline(struct drm_file
              *file_private,<br>
                      drm_syncobj_add_point(timeline_syncobj, chain,
              fence, args-&gt;dst_point);<br>
               err1:<br>
                      dma_fence_put(fence);<br>
              +       drm_syncobj_put(src_syncobj);<br>
               err:<br>
                      drm_syncobj_put(timeline_syncobj);<br>
              <br>
              @@ -714,7 +726,8 @@ static int<br>
               drm_syncobj_transfer_to_binary(struct drm_file
              *file_private,<br>
                                             struct drm_syncobj_transfer
              *args)<br>
               {<br>
              -       struct drm_syncobj *binary_syncobj = NULL;<br>
              +       struct drm_syncobj *binary_syncobj;<br>
              +       struct drm_syncobj *src_syncobj;<br>
                      struct dma_fence *fence;<br>
                      int ret;<br>
              <br>
              @@ -722,11 +735,13 @@
              drm_syncobj_transfer_to_binary(struct drm_file
              *file_private,<br>
                      if (!binary_syncobj)<br>
                              return -ENOENT;<br>
                      ret = drm_syncobj_find_fence(file_private,
              args-&gt;src_handle,<br>
              -                                    args-&gt;src_point,
              args-&gt;flags, &amp;fence);<br>
              +                                    args-&gt;src_point,
              args-&gt;flags,<br>
              +                                    &amp;src_syncobj,
              &amp;fence);<br>
                      if (ret)<br>
                              goto err;<br>
                      drm_syncobj_replace_fence(binary_syncobj, fence);<br>
                      dma_fence_put(fence);<br>
              +       drm_syncobj_put(src_syncobj);<br>
               err:<br>
                      drm_syncobj_put(binary_syncobj);<br>
              <br>
              diff --git a/drivers/gpu/drm/v3d/v3d_gem.c
              b/drivers/gpu/drm/v3d/v3d_gem.c<br>
              index 27e0f87075d9..26bd3a2e39ca 100644<br>
              --- a/drivers/gpu/drm/v3d/v3d_gem.c<br>
              +++ b/drivers/gpu/drm/v3d/v3d_gem.c<br>
              @@ -431,6 +431,7 @@ v3d_job_init(struct v3d_dev *v3d,
              struct drm_file *file_priv,<br>
                           struct v3d_job *job, void (*free)(struct kref
              *ref),<br>
                           u32 in_sync)<br>
               {<br>
              +       struct drm_syncobj *in_syncobj = NULL;<br>
                      struct dma_fence *in_fence = NULL;<br>
                      int ret;<br>
              <br>
              @@ -443,10 +444,12 @@ v3d_job_init(struct v3d_dev *v3d,
              struct drm_file *file_priv,<br>
              <br>
                      xa_init_flags(&amp;job-&gt;deps, XA_FLAGS_ALLOC);<br>
              <br>
              -       ret = drm_syncobj_find_fence(file_priv, in_sync,
              0, 0, &amp;in_fence);<br>
              +       ret = drm_syncobj_find_fence(file_priv, in_sync,
              0, 0, &amp;syncobj, &amp;in_fence);<br>
                      if (ret == -EINVAL)<br>
                              goto fail;<br>
              <br>
              +       drm_syncobj_put(in_sync);<br>
              +<br>
                      ret = drm_gem_fence_array_add(&amp;job-&gt;deps,
              in_fence);<br>
                      if (ret)<br>
                              goto fail;<br>
              diff --git a/include/drm/drm_syncobj.h
              b/include/drm/drm_syncobj.h<br>
              index 6cf7243a1dc5..08eca690f783 100644<br>
              --- a/include/drm/drm_syncobj.h<br>
              +++ b/include/drm/drm_syncobj.h<br>
              @@ -121,6 +121,7 @@ void drm_syncobj_replace_fence(struct
              drm_syncobj *syncobj,<br>
                                             struct dma_fence *fence);<br>
               int drm_syncobj_find_fence(struct drm_file *file_private,<br>
                                         u32 handle, u64 point, u64
              flags,<br>
              +                          struct drm_syncobj **syncobj,<br>
                                         struct dma_fence **fence);<br>
               void drm_syncobj_free(struct kref *kref);<br>
               int drm_syncobj_create(struct drm_syncobj **out_syncobj,
              uint32_t flags,<br>
              --<br>
              2.21.0.392.gf8f6787159e<br>
              <br>
            </div>
          </span></font> </blockquote>
      <p><br>
      </p>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
Intel-gfx mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Intel-gfx@lists.freedesktop.org">Intel-gfx@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/intel-gfx">https://lists.freedesktop.org/mailman/listinfo/intel-gfx</a></pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------3DE8C6EE096361AED4B70F8C--

--===============0929679270==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0929679270==--
